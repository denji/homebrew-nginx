class OpenrestyOpenssl < Formula
  desc "This OpenSSL library build is specifically for OpenResty uses"
  homepage "https://www.openssl.org/"
  VERSION = "1.1.0l".freeze
  revision 1

  stable do
    url "https://www.openssl.org/source/old/1.1.0/openssl-#{VERSION}.tar.gz"
    mirror "https://openresty.org/download/openssl-#{VERSION}.tar.gz"
    sha256 "74a2f756c64fd7386a29184dc0344f4831192d61dc2481a93a4c5dd727f41148"

    patch do
      url "https://raw.githubusercontent.com/openresty/openresty/master/patches/openssl-1.1.0d-sess_set_get_cb_yield.patch"
      sha256 "886e3abbbc56f88c60554c13bf34c4d2f21b97fabd137cd0a213b3c3d396257e"
    end

    patch do
      url "https://raw.githubusercontent.com/openresty/openresty/master/patches/openssl-1.1.0j-parallel_build_fix.patch"
      sha256 "060720ca2b93452dcf68211064841e0417c4a4a40e976fe0b2b5797162917066"
    end
  end

  keg_only "only for use with OpenResty"

  # Only needs 5.10 to run, but needs >5.13.4 to run the testsuite.
  # https://github.com/openssl/openssl/blob/4b16fa791d3ad8/README.PERL
  # The MacOS ML tag is same hack as the way we handle most :python deps.
  depends_on "perl" if build.with?("test") && MacOS.version <= :mountain_lion

  # SSLv2 died with 1.1.0, so no-ssl2 no longer required.
  # SSLv3 & zlib are off by default with 1.1.0 but this may not
  # be obvious to everyone, so explicitly state it for now to
  # help debug inevitable breakage.
  def configure_args
    %W[
      --prefix=#{prefix}
      --openssldir=#{openssldir}
      --libdir=lib
      no-threads
      shared
      zlib
      -g
      enable-ssl3
      enable-ssl3-method
    ]
  end

  def install
    # This could interfere with how we expect OpenSSL to build.
    ENV.delete("OPENSSL_LOCAL_CONFIG_DIR")

    # This ensures where Homebrew's Perl is needed the Cellar path isn't
    # hardcoded into OpenSSL's scripts, causing them to break every Perl update.
    # Whilst our env points to opt_bin, by default OpenSSL resolves the symlink.
    ENV["PERL"] = Formula["perl"].opt_bin/"perl" if which("perl") == Formula["perl"].opt_bin/"perl"

    # x86_64
    arch_args = if Hardware::CPU.is_64_bit? # Hardware::CPU.arch_64_bit?
      %w[darwin64-x86_64-cc enable-ec_nistp_64_gcc_128]
    else
      %w[darwin-i386-cc]
    end

    # Install
    # ENV.deparallelize
    system "perl", "./Configure", *(configure_args + arch_args)
    system "make"
    system "make", "test" if build.with?("test")
    system "make", "install", "MANDIR=#{man}", "MANSUFFIX=ssl"
  end

  def openssldir
    etc/"openssl@1.1"
  end

  test do
    # Check OpenSSL itself functions as expected.
    (testpath/"testfile.txt").write("This is a test file")
    expected_checksum = "e2d0fe1585a63ec6009c8016ff8dda8b17719a637405a4e23c0ff81339148249"
    system "#{bin}/openssl", "dgst", "-sha256", "-out", "checksum.txt", "testfile.txt"
    open("checksum.txt") do |f|
      checksum = f.read(100).split("=").last.strip
      assert_equal checksum, expected_checksum
    end
  end
end

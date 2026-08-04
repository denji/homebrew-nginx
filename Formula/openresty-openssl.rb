class OpenrestyOpenssl < Formula
  desc "OpenSSL 1.1.1 pinned for OpenResty"
  homepage "https://www.openssl.org/"
  license "OpenSSL"
  url "https://www.openssl.org/source/openssl-1.1.1w.tar.gz"
  mirror "https://openresty.org/download/openssl-1.1.1w.tar.gz"
  sha256 "cf3098950cb4d853ad95c0841f1f9c6d3dc102dccfcacd521d93925208b76ac8"

  stable do
    patch do
      url "https://raw.githubusercontent.com/openresty/openresty/master/patches/openssl-1.1.1f-sess_set_get_cb_yield.patch"
      sha256 "d289aa9464552f8caf19de01732ad06832f5f7decaaa4a1eb8c3034ed8a155eb"
    end
  end

  keg_only "only for use with OpenResty"

  def install
    ENV.delete("OPENSSL_LOCAL_CONFIG_DIR")
    ENV["PERL"] = Formula["perl"].opt_bin/"perl" if which("perl") == Formula["perl"].opt_bin/"perl"

    arch_args = if Hardware::CPU.arm?
      %w[darwin64-arm64-cc]
    elsif Hardware::CPU.is_64_bit?
      %w[darwin64-x86_64-cc enable-ec_nistp_64_gcc_128]
    else
      %w[darwin-i386-cc]
    end

    args = %W[
      --prefix=#{prefix}
      --openssldir=#{etc}/openresty-openssl
      --libdir=lib
      shared
      zlib
      -g
    ]

    system "perl", "./Configure", *(args + arch_args)
    system "make"
    system "make", "install", "MANDIR=#{man}", "MANSUFFIX=ssl"
  end

  test do
    (testpath/"testfile.txt").write("openresty-openssl test")
    system bin/"openssl", "dgst", "-sha256", "-out", testpath/"checksum.txt", testpath/"testfile.txt"
    assert_predicate testpath/"checksum.txt", :exist?
  end
end

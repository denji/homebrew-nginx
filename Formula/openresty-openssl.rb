class OpenrestyOpenssl < Formula
  desc "This OpenSSL library build is specifically for OpenResty uses.
  It may contain custom patches from OpenResty."
  homepage "https://www.openssl.org/"
  VERSION = "1.0.2j"

  stable do
    url "https://www.openssl.org/source/openssl-#{VERSION}.tar.gz"
    mirror "https://dl.bintray.com/homebrew/mirror/openssl-1#{VERSION}.tar.gz"
    mirror "https://www.mirrorservice.org/sites/ftp.openssl.org/source/openssl-#{VERSION}.tar.gz"
    sha256 "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"

    patch do
      url "https://raw.githubusercontent.com/openresty/openresty/master/patches/openssl-1.0.2h-sess_set_get_cb_yield.patch"
      sha256 "6d6e02c21769784b106b62a146bfbfeac54884e23520c8dd29b74f3e1348d4a1"
    end
  end

  def install
    # OpenSSL will prefer the PERL environment variable if set over $PATH
    # which can cause some odd edge cases & isn't intended. Unset for safety.
    ENV.delete("PERL")

    # Load zlib from an explicit path instead of relying on dyld's fallback
    # path, which is empty in a SIP context. This patch will be unnecessary
    # when we begin building openssl with no-comp to disable TLS compression.
    # https://langui.sh/2015/11/27/sip-and-dlopen
    inreplace "crypto/comp/c_zlib.c",
              'zlib_dso = DSO_load(NULL, "z", NULL, 0);',
              'zlib_dso = DSO_load(NULL, "/usr/lib/libz.dylib", NULL, DSO_FLAG_NO_NAME_TRANSLATION);'

    args = [
       "no-threads",
       "shared",
       "zlib",
       "-g",
      "--openssldir=#{prefix}",
      "--libdir=lib"
    ]

    if MacOS.prefer_64_bit?
      args << "darwin64-x86_64-cc"
      args << "enable-ec_nistp_64_gcc_128"
    else
      args << "darwin-i386-cc"
    end

    system "./Configure", *args

    # Install
    system "make"
    system "make", "install"
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

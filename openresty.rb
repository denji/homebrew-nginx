require 'formula'

class Openresty < Formula

  homepage 'http://openresty.org'
  url 'http://openresty.org/download/ngx_openresty-1.2.8.6.tar.gz'
  sha1 '4b47862a77577d06447d17c935e94dc935c279e5'
  version '1.2.8.6'

  depends_on "luajit"
  depends_on "pcre"

  def install

    # Logs
    log_path = '/var/log/openresty'
    Dir.mkdir log_path, 0755

    # Configure
    cc_opt = "-I#{HOMEBREW_PREFIX}/include"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib"
    args = [
      "--prefix=#{prefix}",
      "--sbin-path=#{bin}/openresty",
      "--conf-path=#{etc}/openresty/nginx.conf",
      "--error-log-path=#{log_path}/error.log",
      "--http-log-path=#{log_path}/access.log",
      "--with-luajit",
      "--with-cc-opt=#{cc_opt}",
      "--with-ld-opt=#{ld_opt}"
      ]
    system "./configure", *args

    # Install
    system 'make'
    system 'make install'

  end

end

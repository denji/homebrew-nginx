require 'formula'

class Openresty < Formula

  homepage 'http://openresty.org'
  url 'http://openresty.org/download/ngx_openresty-1.2.8.6.tar.gz'
  sha1 '4b47862a77577d06447d17c935e94dc935c279e5'
  version '1.2.8.6'

  depends_on "luajit"
  depends_on "pcre"
  depends_on 'set-misc-nginx-module'

  def install

    # Configure
    cc_opt = "-I#{HOMEBREW_PREFIX}/include"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib"
    args = [
      "--prefix=#{prefix}",
      "--pid-path=#{var}/run/openresty.pid",
      "--lock-path=#{var}/run/openresty.lock",
      "--sbin-path=#{bin}/openresty",
      "--conf-path=#{etc}/openresty/nginx.conf",
      "--http-log-path=#{var}/log/nginx/access.log",
      "--error-log-path=#{var}/log/nginx/error.log",
      "--with-luajit",
      "--with-http_postgres_module",
      "--with-cc-opt=#{cc_opt}",
      "--with-ld-opt=#{ld_opt}",
      "--add-module=/usr/local/share/set-misc-nginx-module"
      ]
    system "./configure", *args

    # Install
    system 'make'
    system 'make install'

  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_prefix}/bin/openresty</string>
            <string>-g</string>
            <string>daemon off;</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

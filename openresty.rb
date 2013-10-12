require 'formula'

class Openresty < Formula

  homepage 'http://openresty.org'
  url 'http://openresty.org/download/ngx_openresty-1.4.2.9.tar.gz'
  sha1 'd6df036381e88125745475d686643f4bb9830974'
  version '1.4.2.9'

  depends_on "luajit"
  depends_on "pcre"

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
      "--with-cc-opt=#{cc_opt}",
      "--with-ld-opt=#{ld_opt}"
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

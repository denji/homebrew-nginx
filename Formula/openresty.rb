class Openresty < Formula
  desc "Fast web app server"
  homepage "http://openresty.org"
  url "https://openresty.org/download/openresty-1.9.15.1.tar.gz"
  sha256 "75cf020144048c9013ee487cb48107a5b99de04a5a8fa83839c8b4c3aa4eb0db"

  # nginx options
  option "without-luajit", "Compile *without* support for the Lua Just-In-Time Compiler"
  option "with-postgresql", "Compile with support for direct communication with PostgreSQL database servers"
  option "with-iconv", "Compile with support for converting character encodings"
  option "with-debug", "Compile with support for debug logging but without proper gdb debugging symbols"

  # nginx options
  option "with-webdav", "Compile with ngx_http_dav_module"
  option "with-gunzip", "Compile with ngx_http_gunzip_module"
  option "with-geoip", "Compile with ngx_http_geoip_module"
  option "with-stub_status", "Compile with ngx_http_stub_status_module"

  depends_on "pcre"
  depends_on "openssl"
  depends_on "postgresql" => :optional
  depends_on "geoip" => :optional

  def install
    # Configure
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{Formula["pcre"].opt_include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{Formula["pcre"].opt_lib}"
    args = [
      "--prefix=#{prefix}",
      "--pid-path=#{var}/run/openresty.pid",
      "--lock-path=#{var}/run/openresty.lock",
      "--sbin-path=#{bin}/openresty",
      "--conf-path=#{etc}/openresty/nginx.conf",
      "--http-log-path=#{var}/log/nginx/access.log",
      "--error-log-path=#{var}/log/nginx/error.log",
      "--with-pcre",
      "--with-pcre-jit",
      "--with-cc-opt=#{cc_opt}",
      "--with-ld-opt=#{ld_opt}",
    ]

    # OpenResty options
    args << "--with-lua51" if build.without? "luajit"
    args << "--with-http_dav_module" if build.with? "webdav"
    args << "--with-http_gunzip_module" if build.with? "gunzip"
    args << "--with-http_geoip_module" if build.with? "geoip"
    args << "--with-http_stub_status_module" if build.with? "stub_status"
    args << "--with-http_postgres_module" if build.with? "postgresql"
    args << "--with-http_iconv_module" if build.with? "iconv"

    # Debugging mode, unfortunately without debugging symbols
    if build.with? "debug"
      args << "--with-debug"
      args << "--with-dtrace-probes"
      args << "--with-no-pool-patch"

      # this allows setting of `debug.sethook` in luajit
      if build.with? "luajit"
        args << "--with-luajit-xcflags=-DLUAJIT_ENABLE_CHECKHOOK"
      end

      opoo "Openresty will be built --with-debug option, but without debugging symbols."\
           "For debugging symbols you have to compile it by hand."
    end

    system "./configure", *args

    # Install
    system "make"
    system "make", "install"
  end

  plist_options :manual => "openresty"

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

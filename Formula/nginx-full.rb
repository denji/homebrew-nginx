class NginxFull < Formula
  desc "HTTP(S) server and reverse proxy, and IMAP/POP3 proxy server"
  homepage "http://nginx.org/"
  url "http://nginx.org/download/nginx-1.8.0.tar.gz"
  sha256 "23cca1239990c818d8f6da118320c4979aadf5386deda691b1b7c2c96b9df3d5"
  head "http://hg.nginx.org/nginx/", :using => :hg

  devel do
    url "http://nginx.org/download/nginx-1.9.7.tar.gz"
    sha256 "794bd217affdfce1c6263d9199c3961f387a2df9d57dcb42876faaf41c1748d5"
  end

  def self.core_modules
    [
      ["passenger",        nil,                        "Compile with support for Phusion Passenger module"],
      ["no-pool-nginx",    nil,                        "Disable nginx-pool, valgrind detect memory issues"],
      ["addition",         "http_addition_module",     "Compile with support for HTTP Addition module"],
      ["auth-req",         "http_auth_request_module", "Compile with support for HTTP Auth Request module"],
      ["debug",            "debug",                    "Compile with support for debug log"],
      ["degredation",      "http_degradation_module",  "Compile with support for HTTP Degredation module"],
      ["flv",              "http_flv_module",          "Compile with support for FLV module"],
      ["geoip",            "http_geoip_module",        "Compile with support for GeoIP module"],
      ["google-perftools", "google_perftools_module",  "Compile with support for Google Performance tools module"],
      ["gunzip",           "http_gunzip_module",       "Compile with support for gunzip module"],
      ["gzip-static",      "http_gzip_static_module",  "Compile with support for Gzip static module"],
      ["http2",            "http_v2_module",           "Compile with support for HTTP/2 module"],
      ["image-filter",     "http_image_filter_module", "Compile with support for Image Filter module"],
      ["mail",             "mail",                     "Compile with support for Mail module"],
      ["mp4",              "http_mp4_module",          "Compile with support for mp4 module"],
      ["pcre-jit",         "pcre-jit",                 "Compile with support for JIT in PCRE"],
      ["perl",             "http_perl_module",         "Compile with support for Perl module"],
      ["random-index",     "http_random_index_module", "Compile with support for Random Index module"],
      ["realip",           "http_realip_module",       "Compile with support for real IP module"],
      ["secure-link",      "http_secure_link_module",  "Compile with support for secure link module"],
      ["spdy",             "http_spdy_module",         "Compile with support for SPDY module"],
      ["status",           "http_stub_status_module",  "Compile with support for stub status module"],
      ["stream",           "stream",                   "Compile with support for TCP load balancing module"],
      ["sub",              "http_sub_module",          "Compile with support for HTTP Sub module"],
      ["webdav",           "http_dav_module",          "Compile with support for WebDAV module"],
      ["xslt",             "http_xslt_module",         "Compile with support for XSLT module"],
    ]
  end

  def self.third_party_modules
    {
      "accept-language" => "Compile with support for Accept Language module",
      "accesskey" => "Compile with support for HTTP Access Key module",
      "ajp" => "Compile with support for AJP-protocol",
      "anti-ddos" => "Compile with support for Anti-DDoS module",
      "array-var" => "Compile with support for Array Var module",
      "auth-digest" => "Compile with support for Auth Digest module",
      "auth-ldap" => "Compile with support for Auth LDAP module",
      "auth-pam" => "Compile with support for Auth PAM module",
      "auto-keepalive" => "Compile with support for Auto Disable KeepAlive module",
      "autols" => "Compile with support for Flexible Auto Index module",
      "cache-purge" => "Compile with support for Cache Purge module",
      "captcha" => "Compile with support for Captcha module",
      "consistent-hash" => "Compile with support for Consistent Hash Upstream module",
      "counter-zone" => "Compile with support for Realtime Counter Zone module",
      "ctpp2" => "Compile with support for CT++ module",
      "dav-ext" => "Compile with support for HTTP WebDav Extended module",
      "dosdetector" => "Compile with support for detecting DoS attacks",
      "echo" => "Compile with support for Echo module",
      "eval" => "Compile with support for Eval module",
      "extended-status" => "Compile with support for Extended Status module",
      "fancyindex" => "Compile with support for Fancy Index module",
      "headers-more" => "Compile with support for Headers More module",
      "healthcheck" => "Compile with support for Healthcheck module",
      "http-accounting" => "Compile with support for HTTP Accounting module",
      "http-flood-detector" => "Compile with support for Var Flood-Threshold module",
      "http-remote-passwd" => "Compile with support for Remote Basic Auth password module",
      "log-if" => "Compile with support for Log-if module",
      "lua" => "Compile with support for LUA module",
      "mod-zip" => "Compile with support for HTTP Zip module",
      "mogilefs" => "Compile with support for HTTP MogileFS module",
      "mp4-h264" => "Compile with support for HTTP MP4/H264 module",
      "naxsi" => "Compile with support for Naxsi module",
      "notice" => "Compile with support for HTTP Notice module",
      "php-session" => "Compile with support for Parse PHP Sessions module",
      "push-stream" => "Compile with support for http push stream module",
      "realtime-req" => "Compile with support for Realtime Request module",
      "redis" => "Compile with support for Redis module",
      "redis2" => "Compile with support for Redis2 module",
      "rtmp" => "Compile with support for RTMP module",
      "set-misc" => "Compile with support for Set Misc module",
      "small-light" => "Compile with support for small light module",
      "subs-filter" => "Compile with support for Substitutions Filter module",
      "tcp-proxy" => "Compile with support for TCP proxy",
      "txid" => "Compile with support for Sortable Unique ID",
      "unzip" => "Compile with support for UnZip module",
      "upload" => "Compile with support for Upload module",
      "upload-progress" => "Compile with support for Upload Progress module",
      "upstream-order" => "Compile with support for Order Upstream module",
      "ustats" => "Compile with support for Upstream Statistics (HAProxy style) module",
      "var-req-speed" => "Compile with support for Var Request-Speed module",
      "websockify" => "Compile with support for websockify module",
      "xsltproc" => "Compile with support for XSLT transformations",
    }
  end

  if build.with?("http-flood-detector-module") && build.without?("status")
    raise "http-flood-detector-nginx-module: Stub Status module is required --with-status"
  end

  if build.with?("dav-ext-module") && build.without?("webdav")
    raise "dav-ext-nginx-module: WebDav Extended module is required --with-webdav"
  end

  depends_on "pcre"
  depends_on "passenger" => :optional
  depends_on "geoip" => :optional
  depends_on "openssl" => :recommended
  depends_on "libressl" => :optional
  depends_on "libzip" if build.with? "unzip"
  depends_on "libxml2" if build.with? "xslt"
  depends_on "libxslt" if build.with? "xslt"
  depends_on "gd" if build.with? "image-filter"
  depends_on "valgrind" if build.with? "no-pool-nginx"
  depends_on "icu4c" if build.with? "xsltproc-module"
  depends_on "libxml2" if build.with? "xsltproc-module"
  depends_on "libxslt" if build.with? "xsltproc-module"
  depends_on "google-perftools" => :optional
  depends_on "gd" => :optional
  depends_on "imlib2" => :optional

  self.core_modules.each do |arr|
    option "with-#{arr[0]}", arr[2]
  end
  self.third_party_modules.each do |name, desc|
    option "with-#{name}-module", desc
    depends_on "#{name}-nginx-module" if build.with? "#{name}-module"
  end

  def patches
    patches = {}
    # https://github.com/openresty/no-pool-nginx
    if build.with? "no-pool-nginx"
      patches[:p2] = "https://raw.githubusercontent.com/openresty/no-pool-nginx/master/nginx-1.7.7-no_pool.patch" if build.devel?
    end
    if build.with? "extended-status-module"
      patches[:p1] = "https://raw.githubusercontent.com/nginx-modules/ngx_http_extended_status_module/master/extended_status-1.6.2.patch"
    end
    if build.with? "ustats-module"
      patches[:p1] = "https://raw.githubusercontent.com/nginx-modules/ngx_ustats_module/master/nginx-1.6.1.patch"
    end
    if build.with? "tcp-proxy-module"
      patches[:p1] = "https://raw.githubusercontent.com/yaoweibin/nginx_tcp_proxy_module/v0.4.5/tcp.patch"
    end
    patches
  end

  env :userpaths
  skip_clean "logs"

  def install
    # small-light needs to run setup script
    if build.with? "small-light-module"
      small_light = Formula["small-light-nginx-module"]
      args = build.used_options.select { |option| ["with-gd", "with-imlib2"].include?(option.name) }
      origin_dir = Dir.pwd
      Dir.chdir("#{small_light.share}/#{small_light.name}")
      system "./setup", *args
      raise "The small-light setup script couldn't generate config file." unless File.exist?("./config")
      Dir.chdir(origin_dir)
    end

    # Changes default port to 8080
    inreplace "conf/nginx.conf", "listen       80;", "listen       8080;"
    inreplace "conf/nginx.conf", "    #}\n\n}", "    #}\n    include servers/*;\n}"

    pcre = Formula["pcre"]
    openssl = Formula["openssl"]
    libressl = Formula["libressl"]
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{pcre.include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{pcre.lib}"

    if build.with? "libressl"
      cc_opt += " -I#{libressl.include}"
      ld_opt += " -L#{libressl.lib}"
    else
      cc_opt += " -I#{openssl.include}"
      ld_opt += " -L#{openssl.lib}"
    end

    if build.with? "xsltproc-module"
      icu = Formula["icu4c"]
      cc_opt += " -I#{icu.opt_include}"
      ld_opt += " -L#{icu.opt_lib}"
    end

    cc_opt += " -I#{Formula["libzip"].opt_lib}/libzip/include" if build.with? "unzip"

    args = %W[
      --prefix=#{prefix}
      --with-http_ssl_module
      --with-pcre
      --with-ipv6
      --sbin-path=#{bin}/nginx
      --with-cc-opt=#{cc_opt}
      --with-ld-opt=#{ld_opt}
      --conf-path=#{etc}/nginx/nginx.conf
      --pid-path=#{var}/run/nginx.pid
      --lock-path=#{var}/run/nginx.lock
      --http-client-body-temp-path=#{var}/run/nginx/client_body_temp
      --http-proxy-temp-path=#{var}/run/nginx/proxy_temp
      --http-fastcgi-temp-path=#{var}/run/nginx/fastcgi_temp
      --http-uwsgi-temp-path=#{var}/run/nginx/uwsgi_temp
      --http-scgi-temp-path=#{var}/run/nginx/scgi_temp
      --http-log-path=#{var}/log/nginx/access.log
      --error-log-path=#{var}/log/nginx/error.log
    ]

    # Core Modules
    args += self.class.core_modules.select { |arr|
      build.with? arr[0]
    }.collect { |arr|
      "--with-#{arr[1]}" if arr[1]
    }.compact

    # Set misc module depends on nginx-devel-kit being compiled in
    if build.with? "set-misc-module"
      args << "--add-module=#{HOMEBREW_PREFIX}/share/ngx-devel-kit"
    end

    # Third Party Modules
    args += self.class.third_party_modules.select { |name, _desc|
      build.with? "#{name}-module"
    }.collect { |name, _desc|
      "--add-module=#{HOMEBREW_PREFIX}/share/#{name}-nginx-module"
    }

    # Passenger
    if build.with? "passenger"
      nginx_ext = `#{Formula["passenger"].opt_bin}/passenger-config --nginx-addon-dir`.chomp
      args << "--add-module=#{nginx_ext}"
    end

    # Install LuaJit
    if build.with? "lua-module"
      luajit_path = `brew --prefix luajit`.chomp
      ENV["LUAJIT_LIB"] = "#{luajit_path}/lib"
      ENV["LUAJIT_INC"] = "#{luajit_path}/include/luajit-2.0"
    end

    if build.head?
      system "./auto/configure", *args
    else
      system "./configure", *args
    end

    system "make", "install"
    if build.head?
      man8.install "docs/man/nginx.8"
    else
      man8.install "man/nginx.8"
    end

    (etc/"nginx/servers").mkpath
    (var/"run/nginx").mkpath
  end

  def post_install
    # nginx's docroot is #{prefix}/html, this isn't useful, so we symlink it
    # to #{HOMEBREW_PREFIX}/var/www. The reason we symlink instead of patching
    # is so the user can redirect it easily to something else if they choose.
    html = prefix/"html"
    dst  = var/"www"

    if dst.exist?
      html.rmtree
      dst.mkpath
    else
      dst.dirname.mkpath
      html.rename(dst)
    end

    prefix.install_symlink dst => "html"

    # for most of this formula's life the binary has been placed in sbin
    # and Homebrew used to suggest the user copy the plist for nginx to their
    # ~/Library/LaunchAgents directory. So we need to have a symlink there
    # for such cases
    if rack.subdirs.any? { |d| d.join("sbin").directory? }
      sbin.install_symlink bin/"nginx"
    end
  end

  def passenger_caveats; <<-EOS.undent
    To activate Phusion Passenger, add this to #{etc}/nginx/nginx.conf, inside the 'http' context:
      passenger_root #{Formula["passenger"].opt_libexec}/lib/phusion_passenger/locations.ini;
      passenger_ruby /usr/bin/ruby;
    EOS
  end

  def caveats
    s = <<-EOS.undent
    Docroot is: #{var}/www

    The default port has been set in #{etc}/nginx/nginx.conf to 8080 so that
    nginx can run without sudo.

    nginx will load all files in #{etc}/nginx/servers/.

    - Tips -
    Run port 80:
     $ sudo chown root:wheel #{sbin}/nginx
     $ sudo chmod u+s #{sbin}/nginx
    Reload config:
     $ nginx -s reload
    Reopen Logfile:
     $ nginx -s reopen
    Stop process:
     $ nginx -s stop
    Waiting on exit process
     $ nginx -s quit
    EOS
    s << "\n" << passenger_caveats if build.with? "passenger"
    s
  end

  test do
    system "#{bin}/nginx", "-t"
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
            <string>#{opt_bin}/nginx</string>
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

require "formula"

class NginxFull < Formula

  homepage "http://nginx.org/"
  url "http://nginx.org/download/nginx-1.6.2.tar.gz"
  sha1 "1a5458bc15acf90eea16353a1dd17285cf97ec35"

  devel do
    url "http://nginx.org/download/nginx-1.7.9.tar.gz"
    sha1 "44ef4770db281cea26a1b2e66c0e34193e1d1f1f"
  end

  head "http://hg.nginx.org/nginx/", :using => :hg

  def self.core_modules
    [
      ["passenger",        nil,                        "Compile with support for Phusion Passenger module"],
      ["no-pool-nginx",    nil,                        "Disable nginx-pool, valgrind detect memory issues"],
      ["webdav",           "http_dav_module",          "Compile with support for WebDAV module"],
      ["spdy",             "http_spdy_module",         "Compile with support for SPDY module"],
      ["gunzip",           "http_gunzip_module",       "Compile with support for gunzip module"],
      ["secure-link",      "http_secure_link_module",  "Compile with support for secure link module"],
      ["status",           "http_stub_status_module",  "Compile with support for stub status module"],
      ["mp4",              "http_mp4_module",          "Compile with support for mp4 module"],
      ["realip",           "http_realip_module",       "Compile with support for real IP module"],
      ["perl",             "http_perl_module",         "Compile with support for Perl module"],
      ["sub",              "http_sub_module",          "Compile with support for HTTP Sub module"],
      ["addition",         "http_addition_module",     "Compile with support for HTTP Addition module"],
      ["degredation",      "http_degradation_module",  "Compile with support for HTTP Degredation module"],
      ["flv",              "http_flv_module",          "Compile with support for FLV module"],
      ["geoip",            "http_geoip_module",        "Compile with support for GeoIP module"],
      ["gzip-static",      "http_gzip_static_module",  "Compile with support for Gzip static module"],
      ["image-filter",     "http_image_filter_module", "Compile with support for Image Filter module"],
      ["random-index",     "http_random_index_module", "Compile with support for Random Index module"],
      ["xslt",             "http_xslt_module",         "Compile with support for XSLT module"],
      ["auth-req",         "http_auth_request_module", "Compile with support for HTTP Auth Request Module"],
      ["mail",             "mail",                     "Compile with support for Mail module"],
      ["debug",            "debug",                    "Compile with support for debug log"],
      ["pcre-jit",         "pcre-jit",                 "Compile with support for JIT in PCRE"],
      ["google-perftools", "google_perftools_module",  "Compile with support for Google Performance tools module"]
    ]
  end

  def self.third_party_modules
    {
      "lua" => "Compile with support for LUA module",
      "echo" => "Compile with support for Echo Module",
      "auth-digest" => "Compile with support for Auth Digest Module",
      "set-misc" => "Compile with support for Set Misc Module",
      "redis2" => "Compile with support for Redis2 Module",
      "array-var" => "Compile with support for Array Var Module",
      "accept-language" => "Compile with support for Accept Language Module",
      "accesskey" => "Compile with support for HTTP Access Key Module",
      "auth-ldap" => "Compile with support for Auth LDAP Module",
      "auth-pam" => "Compile with support for Auth PAM Module",
      "cache-purge" => "Compile with support for Cache Purge Module",
      "ctpp2" => "Compile with support for CT++ Module",
      "headers-more" => "Compile with support for Headers More Module",
      "tcp-proxy" => "Compile with support for TCP proxy",
      "dav-ext" => "Compile with support for HTTP WebDav Extended Module",
      "eval" => "Compile with support for Eval Module",
      "fancyindex" => "Compile with support for Fancy Index Module",
      "mogilefs" => "Compile with support for HTTP MogileFS Module",
      "mp4-h264" => "Compile with support for HTTP MP4/H264 Module",
      "notice" => "Compile with support for HTTP Notice Module",
      "subs-filter" => "Compile with support for Substitutions Filter Module",
      "upload" => "Compile with support for Upload module",
      "upload-progress" => "Compile with support for Upload Progress module",
      "php-session" => "Compile with support for Parse PHP Sessions module",
      "anti-ddos" => "Compile with support for Anti-DDoS module",
      "captcha" => "Compile with support for Captcha module",
      "autols" => "Compile with support for Flexible Auto Index module",
      "auto-keepalive" => "Compile with support for Auto Disable KeepAlive module",
      "ustats" => "Compile with support for Upstream Statistics (HAProxy style) module",
      "extended-status" => "Compile with support for Extended Status module",
      "upstream-hash" => "Compile with support for Upstream Hash Module",
      "consistent-hash" => "Compile with support for Consistent Hash Upstream module",
      "healthcheck" => "Compile with support for Healthcheck Module",
      "log-if" => "Compile with support for Log-if Module",
      "txid" => "Compile with support for Sortable Unique ID",
      "upstream-order" => "Compile with support for Order Upstream module",
      "unzip" => "Compile with support for UnZip module",
      "var-req-speed" => "Compile with support for Var Request-Speed module",
      "http-flood-detector" => "Compile with support for Var Flood-Threshold module",
      "http-remote-passwd" => "Compile with support for Remote Basic Auth password module",
      "realtime-req" => "Compile with support for Realtime Request module",
      "counter-zone" => "Compile with support for Realtime Counter Zone module",
      "mod-zip" => "Compile with support for HTTP Zip Module",
      "rtmp" => "Compile with support for RTMP Module",
      "dosdetector" => "Compile with support for detecting DoS attacks",
      "push-stream" => "Compile with support for http push stream module",
    }
  end

  if build.with? "http-flood-detector-module" and build.without? "status"
    raise "http-flood-detector-nginx-module: Stub Status module is required --with-status"
  end

  if build.with? "dav-ext-module" and build.without? "webdav"
    raise "dav-ext-nginx-module: WebDav Extended Module is required --with-webdav"
  end

  depends_on "pcre"
  depends_on "passenger" => :optional
  depends_on "geoip" => :optional
  depends_on "openssl"
  depends_on "libzip" if build.with? "unzip"
  depends_on "libxml2" if build.with? "xslt"
  depends_on "libxslt" if build.with? "xslt"
  depends_on "gd" if build.with? "image-filter"
  depends_on "valgrind" if build.with? "no-pool-nginx"

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
      patches[:p1] = "https://raw.githubusercontent.com/yaoweibin/nginx_tcp_proxy_module/master/tcp.patch"
    end
    patches
  end

  env :userpaths
  skip_clean "logs"

  def install
    # Changes default port to 8080
    inreplace "conf/nginx.conf", "listen       80;", "listen       8080;"

    pcre = Formula["pcre"]
    openssl = Formula["openssl"]
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{pcre.opt_include} -I#{openssl.opt_include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{pcre.opt_lib} -L#{openssl.opt_lib}"

    if build.with? "unzip"
      cc_opt += " -I#{Formula['libzip'].opt_lib}/libzip/include"
    end

    args = ["--prefix=#{prefix}",
            "--with-http_ssl_module",
            "--with-pcre",
            "--with-ipv6",
            "--sbin-path=#{bin}/nginx",
            "--with-cc-opt=#{cc_opt}",
            "--with-ld-opt=#{ld_opt}",
            "--conf-path=#{etc}/nginx/nginx.conf",
            "--pid-path=#{var}/run/nginx.pid",
            "--lock-path=#{var}/run/nginx.lock",
            "--http-client-body-temp-path=#{var}/run/nginx/client_body_temp",
            "--http-proxy-temp-path=#{var}/run/nginx/proxy_temp",
            "--http-fastcgi-temp-path=#{var}/run/nginx/fastcgi_temp",
            "--http-uwsgi-temp-path=#{var}/run/nginx/uwsgi_temp",
            "--http-scgi-temp-path=#{var}/run/nginx/scgi_temp",
            "--http-log-path=#{var}/log/nginx/access.log",
            "--error-log-path=#{var}/log/nginx/error.log"
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
    args += self.class.third_party_modules.select { |name, desc|
      build.with? "#{name}-module"
    }.collect { |name, desc|
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
    system "make"
    system "make install"
    man8.install "objs/nginx.8"
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

  test do
    system "#{bin}/nginx", "-t"
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
    s << passenger_caveats if build.with? "passenger"
    s
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

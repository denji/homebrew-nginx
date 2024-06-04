class NginxFull < Formula
  desc "HTTP(S) server, reverse proxy, IMAP/POP3 proxy server"
  homepage "https://nginx.org/"
  # Use "mainline" releases only (odd minor version number), not "stable"
  # See https://www.nginx.com/blog/nginx-1-12-1-13-released/ for why
  url "https://nginx.org/download/nginx-1.27.0.tar.gz"
  sha256 "b7230e3cf87eaa2d4b0bc56aadc920a960c7873b9991a1b66ffcc08fc650129c"
  license "BSD-2-Clause"
  head "http://hg.nginx.org/nginx/", using: :hg

  option "with-homebrew-libressl", "Include LibreSSL instead of OpenSSL via Homebrew"

  depends_on "gd" if build.with?("image-filter")
  depends_on "icu4c" if build.with?("xsltproc-module")
  depends_on "libxml2" if build.with?("xsltproc-module") ||
                          build.with?("xslt") ||
                          build.with?("dav-ext-module")
  depends_on "libxslt" if build.with?("xsltproc-module") ||
                          build.with?("xslt")
  depends_on "libzip" if build.with?("unzip")
  depends_on "luajit" if build.with?("lua-module")
  depends_on "pcre"
  depends_on "valgrind" if build.with?("no-pool-nginx")
  depends_on "gd" => :optional
  depends_on "geoip" => :optional
  depends_on "gperftools" => :optional
  depends_on "imlib2" => :optional
  depends_on "passenger" => :optional
  depends_on "perl" => :optional

  conflicts_with "nginx", because: "nginx-full symlink with the name for compatibility with nginx"

  def self.core_modules
    [
      ["addition",           "http_addition_module",      "Build with HTTP Addition support"],
      ["auth-req",           "http_auth_request_module",  "Build with HTTP Auth Request support"],
      ["debug",              "debug",                     "Build with debug log"],
      ["degredation",        "http_degradation_module",   "Build with HTTP Degredation support"],
      ["flv",                "http_flv_module",           "Build with FLV support"],
      ["geoip",              "http_geoip_module",         "Build with HTTP GeoIP support"],
      ["google-perftools",   "google_perftools_module",   "Build with Google Performance Tools support"],
      ["gunzip",             "http_gunzip_module",        "Build with Gunzip support"],
      ["gzip-static",        "http_gzip_static_module",   "Build with Gzip static support"],
      ["http2",              "http_v2_module",            "Build with HTTP/2 support"],
      ["http3",              "http_v3_module",            "Build with HTTP/3 support"],
      ["image-filter",       "http_image_filter_module",  "Build with Image Filter support"],
      ["mail",               "mail",                      "Build with Mail support"],
      ["mail-ssl",           "mail_ssl_module",           "Build with Mail SSL/TLS support"],
      ["mp4",                "http_mp4_module",           "Build with MP4 support"],
      ["no-pool-nginx",      nil,                         "Build without nginx-pool (valgrind debug memory)"],
      ["passenger",          nil,                         "Build with Phusion Passenger support"],
      ["pcre-jit",           "pcre-jit",                  "Build with JIT in PCRE"],
      ["perl",               "http_perl_module",          "Build with Perl support"],
      ["random-index",       "http_random_index_module",  "Build with Random Index support"],
      ["realip",             "http_realip_module",        "Build with Real IP support"],
      ["secure-link",        "http_secure_link_module",   "Build with Secure Link support"],
      ["slice",              "http_slice_module",         "Build with Slice support"],
      ["status",             "http_stub_status_module",   "Build with Stub Status support"],
      ["stream",             "stream",                    "Build with TCP/UDP proxy support"],
      ["stream-ssl",         "stream_ssl_module",         "Build with Stream SSL/TLS support"],
      ["stream-ssl-preread", "stream_ssl_preread_module", "Build with Stream without terminating SSL/TLS support"],
      ["stream-geoip",       "stream_geoip_module",       "Build with Stream GeoIP support"],
      ["stream-realip",      "stream_realip_module",      "Build with Stream RealIP support"],
      ["sub",                "http_sub_module",           "Build with HTTP Sub support"],
      ["webdav",             "http_dav_module",           "Build with WebDAV support"],
      ["xslt",               "http_xslt_module",          "Build with XSLT support"],
    ]
  end

  def self.third_party_modules
    {
      "accept-language"     => "Build with Accept Language support",
      "accesskey"           => "Build with HTTP Access Key support",
      "ajp"                 => "Build with AJP-protocol support",
      "anti-ddos"           => "Build with Anti-DDoS support",
      "array-var"           => "Build with Array Var support",
      "auth-digest"         => "Build with Auth Digest support",
      "auth-ldap"           => "Build with Auth LDAP support",
      "auth-pam"            => "Build with Auth PAM support",
      "auto-keepalive"      => "Build with Auto Disable KeepAlive support",
      "autols"              => "Build with Flexible Auto Index support",
      "brotli"              => "Build with Brotli compression support",
      "cache-purge"         => "Build with Cache Purge support",
      "captcha"             => "Build with Captcha support",
      "counter-zone"        => "Build with Realtime Counter Zone support",
      "ctpp2"               => "Build with CT++ support",
      "dav-ext"             => "Build with HTTP WebDav Extended support",
      "dosdetector"         => "Build with detecting DoS attacks support",
      "echo"                => "Build with Echo support",
      "eval"                => "Build with Eval support",
      "extended-status"     => "Build with Extended Status support",
      "fancyindex"          => "Build with Fancy Index support",
      "geoip2"              => "Build with GeoIP2 support",
      "headers-more"        => "Build with Headers More support",
      "healthcheck"         => "Build with Healthcheck support",
      "http-accounting"     => "Build with HTTP Accounting support",
      "http-flood-detector" => "Build with Var Flood-Threshold support",
      "http-remote-passwd"  => "Build with Remote Basic Auth Password support",
      "log-if"              => "Build with Log-if support",
      "lua"                 => "Build with LUA support",
      "mod-zip"             => "Build with HTTP Zip support",
      "mogilefs"            => "Build with HTTP MogileFS support",
      "mp4-h264"            => "Build with HTTP MP4/H264 support",
      "mruby"               => "Build with MRuby support",
      "naxsi"               => "Build with Naxsi support",
      "nchan"               => "Build with Nchan support",
      "upstream-check"      => "Build with upstream health check support",
      "njs"                 => "Build with njs support",
      "notice"              => "Build with HTTP Notice support",
      "php-session"         => "Build with Parse PHP Sessions support",
      "tarantool"           => "Build with Tarantool upstream support",
      "push-stream"         => "Build with HTTP Push Stream support",
      "realtime-req"        => "Build with Realtime Request support",
      "redis"               => "Build with Redis support",
      "redis2"              => "Build with Redis2 support",
      "rtmp"                => "Build with RTMP support",
      "set-misc"            => "Build with Set Misc support",
      "small-light"         => "Build with Small Light support",
      "subs-filter"         => "Build with Substitutions Filter support",
      "tcp-proxy"           => "Build with TCP Proxy support",
      "txid"                => "Build with Sortable Unique ID support",
      "unzip"               => "Build with UnZip support",
      "upload"              => "Build with Upload support",
      "upload-progress"     => "Build with Upload Progress support",
      "upstream-order"      => "Build with Order Upstream support",
      "ustats"              => "Build with Upstream Statistics (HAProxy style) support",
      "var-req-speed"       => "Build with Var Request-Speed support",
      "vod"                 => "Build with VOD on-the-fly MP4 Repackager support",
      "vts"                 => "Build with virtual host traffic status support",
      "websockify"          => "Build with Websockify support",
      "xsltproc"            => "Build with XSLT Transformations support",
    }
  end

  if build.with?("homebrew-libressl")
    depends_on "libressl"
  else
    depends_on "openssl@3"
  end

  # HTTP2 (backward compatibility for spdy)
  deprecated_option "with-spdy" => "with-http2" if build.with?("spdy")

  core_modules.each do |arr|
    option "with-#{arr[0]}", arr[2]
  end
  third_party_modules.each do |name, desc|
    option "with-#{name}-module", desc
    depends_on "#{name}-nginx-module" if build.with?("#{name}-module")
  end

  if build.with?("no-pool-nginx")
    # https://github.com/openresty/no-pool-nginx
    patch :p2 do
      url "https://raw.githubusercontent.com/openresty/no-pool-nginx/master/nginx-1.11.2-no_pool.patch"
    end
  end

  if build.with?("extended-status-module")
    patch do
      url "https://raw.githubusercontent.com/nginx-modules/ngx_http_extended_status_module/master/extended_status-1.10.1.patch"
    end
  end

  if build.with?("ustats-module")
    patch do
      url "https://raw.githubusercontent.com/nginx-modules/ngx_ustats_module/master/nginx-1.6.1.patch"
    end
  end

  if build.with?("tcp-proxy-module")
    patch do
      url "https://raw.githubusercontent.com/yaoweibin/nginx_tcp_proxy_module/afcab76/tcp_1_8.patch"
    end
  end

  # env :userpaths
  skip_clean "logs"

  def install
    if build.with?("http-flood-detector-module") && build.without?("status")
      odie "http-flood-detector-nginx-module: Stub Status module is required --with-status"
    end

    if build.with?("dav-ext-module") && build.without?("webdav")
      odie "dav-ext-nginx-module: WebDav Extended module is required --with-webdav"
    end

    # small-light needs to run setup script
    if build.with?("small-light-module")
      small_light = Formula["small-light-nginx-module"]
      img_opts = ["with-gd", "with-imlib2"]
      args = build.used_options.select { |option| img_opts.include?(option.name) }
      origin_dir = Dir.pwd
      Dir.chdir("#{small_light.share}/#{small_light.name}")
      system "./setup", *args
      raise "The small-light setup script couldn't generate config file." unless File.exist?("./config")

      Dir.chdir(origin_dir)
    end

    # mruby module needs to prepare compiling mruby
    if build.with?("mruby-module")
      ENV["NGX_MRUBY_LDFLAGS"] = "-lcrypto"
      mruby = Formula["mruby-nginx-module"]
      origin_dir = Dir.pwd
      Dir.chdir("#{mruby.share}/#{mruby.name}")
      # The compile flow of ngx_mruby is assumed that build_config.rb is managed with git.
      system "git", "init"
      system "git", "submodule", "init"
      system "git", "submodule", "update"
      Dir.chdir("#{mruby.share}/#{mruby.name}/mruby")
      system "git", "add", "build_config.rb"
      system "git", "commit", "-m 'build_config.rb'"
      Dir.chdir("#{mruby.share}/#{mruby.name}")
      system "./configure", "--with-ngx-src-root=#{buildpath}"
      system "make", "build_mruby"
      system "make", "generate_gems_config"
      rm_rf(".git")
      Dir.chdir(origin_dir)
    end

    # Changes default port to 8080
    inreplace "conf/nginx.conf" do |s|
      s.gsub! "listen       80;", "listen       8080;"
      s.gsub! "    #}\n\n}", "    #}\n    include servers/*;\n}"
    end

    pcre = Formula["pcre"]
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{pcre.include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{pcre.lib}"

    if build.with?("libressl")
      cc_opt += " -I#{Formula["libressl"].include}"
      ld_opt += " -L#{Formula["libressl"].lib}"
    else
      cc_opt += " -I#{Formula["openssl@3"].include}"
      ld_opt += " -L#{Formula["openssl@3"].lib}"
    end

    if build.with?("xsltproc-module")
      icu = Formula["icu4c"]
      cc_opt += " -I#{icu.opt_include}"
      ld_opt += " -L#{icu.opt_lib}"
    end

    cc_opt += " -I#{Formula["libzip"].opt_lib}/libzip/include" if build.with?("unzip")

    # https://github.com/openresty/lua-nginx-module/issues/1984
    # module do not support with PCRE2 on nginx 1.21.5
    ld_opt += " -lpcre" if build.with?("lua-module")

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
    self.class.core_modules.each do |arr|
      args << "--with-#{arr[1]}" if build.with?(arr[0]) && arr[1]
    end

    # Set misc module and mruby module both depend on nginx-devel-kit being compiled in
    if build.with?("set-misc-module") ||
       build.with?("mruby-module") ||
       build.with?("lua-module") ||
       build.with?("array-var-module")
      args << "--add-module=#{HOMEBREW_PREFIX}/share/ngx-devel-kit"
    end

    # Third Party Modules
    self.class.third_party_modules.each_key do |name|
      if build.with?("#{name}-module") && (name != "njs")
        args << "--add-module=#{HOMEBREW_PREFIX}/share/#{name}-nginx-module"
      end
    end

    # The njs module is special since it has a command-line component as well, we have to specify the nginx/ subpath
    args << "--add-module=#{HOMEBREW_PREFIX}/share/njs-nginx-module/nginx" if build.with?("njs-module")

    # Passenger
    if build.with?("passenger")
      nginx_ext = `#{Formula["passenger"].opt_bin}/passenger-config --nginx-addon-dir`.chomp
      args << "--add-module=#{nginx_ext}"
    end

    # Install lua-module with luajit
    if build.with?("lua-module")
      luajit_version = Formula["luajit"].pkg_version.to_s.sub(/^(\d+\.\d+).*/, '\1')
      ENV["LUAJIT_INC"] = "#{Formula["luajit"].opt_include}/luajit-#{luajit_version}"
      ENV["LUAJIT_LIB"] = "#{Formula["luajit"].opt_lib}"
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
    dst = var/"www"

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
    sbin.install_symlink bin/"nginx" if rack.subdirs.any? { |d| d.join("sbin").directory? }
  end

  def passenger_caveats
    <<~EOS
      To activate Phusion Passenger, add this to #{etc}/nginx/nginx.conf, inside the 'http' context:
        passenger_root #{Formula["passenger"].opt_libexec}/src/ruby_supportlib/phusion_passenger/locations.ini;
        passenger_ruby /usr/bin/ruby;
    EOS
  end

  def caveats
    s = <<~EOS
      Docroot is: #{var}/www

      The default port has been set in #{etc}/nginx/nginx.conf to 8080 so that
      nginx can run without sudo.

      nginx will load all files in #{etc}/nginx/servers/.

      - Tips -
      Run port 80:
       $ sudo chown root:wheel #{bin}/nginx
       $ sudo chmod u+s #{bin}/nginx
      Reload config:
       $ nginx -s reload
      Reopen Logfile:
       $ nginx -s reopen
      Stop process:
       $ nginx -s stop
      Waiting on exit process
       $ nginx -s quit
    EOS
    s << "\n" << passenger_caveats if build.with?("passenger")
    s
  end

  service do
    run [opt_bin/"nginx", "-g", "daemon off;"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    require_root true
    log_path var/"log/nginx.log"
    error_log_path var/"log/nginx-error.log"
  end

  test do
    (testpath/"nginx.conf").write <<-EOS
      worker_processes 4;
      error_log #{testpath}/error.log;
      pid #{testpath}/nginx.pid;

      events {
        worker_connections 1024;
      }

      http {
        client_body_temp_path #{testpath}/client_body_temp;
        fastcgi_temp_path #{testpath}/fastcgi_temp;
        proxy_temp_path #{testpath}/proxy_temp;
        scgi_temp_path #{testpath}/scgi_temp;
        uwsgi_temp_path #{testpath}/uwsgi_temp;

        server {
          listen 8080;
          root #{testpath};
          access_log #{testpath}/access.log;
          error_log #{testpath}/error.log;
        }
      }
    EOS
    system "#{bin}/nginx", "-t", "-c", testpath/"nginx.conf"
  end
end

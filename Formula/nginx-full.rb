class NginxFull < Formula
  desc "HTTP(S) server, reverse proxy, IMAP/POP3 proxy server"
  homepage "https://nginx.org/"
  url "https://nginx.org/download/nginx-1.30.0.tar.gz"
  sha256 "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
  license "BSD-2-Clause"
  head "https://github.com/nginx/nginx.git", branch: "master"

  # Static core modules
  # [option, configure-flag, description]
  # nil flag = handled separately in install
  def self.core_modules
    [
      ["addition",           "http_addition_module",      "HTTP Addition"],
      ["auth-req",           "http_auth_request_module",  "HTTP Auth Request"],
      ["debug",              "debug",                     "debug log"],
      ["degradation",        "http_degradation_module",   "HTTP Degradation"],
      ["flv",                "http_flv_module",           "FLV"],
      ["google-perftools",   "google_perftools_module",   "Google Performance Tools"],
      ["gunzip",             "http_gunzip_module",        "Gunzip"],
      ["gzip-static",        "http_gzip_static_module",   "Gzip static"],
      ["http2",              "http_v2_module",            "HTTP/2"],
      ["image-filter",       "http_image_filter_module",  "Image Filter"],
      ["mail",               "mail",                      "Mail"],
      ["mail-ssl",           "mail_ssl_module",           "Mail SSL/TLS"],
      ["mp4",                "http_mp4_module",           "MP4"],
      ["no-pool-nginx",      nil,                         "pool disabled (valgrind debug)"],
      ["passenger",          nil,                         "Phusion Passenger"],
      ["pcre-jit",           "pcre-jit",                  "PCRE JIT"],
      ["perl",               "http_perl_module",          "Perl"],
      ["random-index",       "http_random_index_module",  "Random Index"],
      ["realip",             "http_realip_module",        "Real IP"],
      ["secure-link",        "http_secure_link_module",   "Secure Link"],
      ["slice",              "http_slice_module",         "Slice"],
      ["status",             "http_stub_status_module",   "Stub Status"],
      ["stream",             "stream",                    "TCP/UDP proxy"],
      ["stream-ssl",         "stream_ssl_module",         "Stream SSL/TLS"],
      ["stream-ssl-preread", "stream_ssl_preread_module", "Stream SSL preread"],
      ["stream-realip",      "stream_realip_module",      "Stream RealIP"],
      ["sub",                "http_sub_module",           "HTTP Sub"],
      ["webdav",             "http_dav_module",           "WebDAV"],
      ["xslt",               "http_xslt_module",          "XSLT"],
    ]
  end

  # Third-party modules, linked statically into nginx-full via --add-module.
  #
  # Some of these also ship a standalone .so from their own formula, so you
  # do not have to rebuild nginx-full to add or remove them:
  #   auth-digest, cache-purge, dav-ext, echo, fancyindex, geoip2,
  #   headers-more, njs, nchan, redis2, rtmp, subs-filter,
  #   upload-progress, vod, vts, brotli (--HEAD only)
  # Install that module's formula, then in nginx.conf:
  #   load_module modules/ngx_http_<name>_module.so;
  #
  # NDK-dependent modules (lua, set-misc, array-var, mruby, stream-lua) and
  # modules that patch nginx internals (no-pool, extended-status, ustats,
  # tcp-proxy) cannot be dynamic - they are static only, here and everywhere.
  def self.third_party_modules
    {
      "accept-language"     => "Accept-Language header parser",
      "accesskey"           => "HTTP access key enforcement",
      "ajp"                 => "AJP protocol proxy",
      "anti-ddos"           => "Anti-DDoS",
      "array-var"           => "Array variables (requires ngx-devel-kit)",
      "auth-digest"         => "HTTP Digest Authentication",
      "auth-ldap"           => "LDAP authentication",
      "auth-pam"            => "PAM authentication",
      "auto-keepalive"      => "Auto disable keepalive",
      "autols"              => "Flexible auto index",
      "brotli"              => "Brotli compression",
      "cache-purge"         => "Cache purge",
      "captcha"             => "Captcha",
      "counter-zone"        => "Realtime counter zones",
      "ctpp2"               => "CT++ template engine",
      "dav-ext"             => "WebDAV PROPFIND/OPTIONS",
      "dosdetector"         => "DoS detection",
      "echo"                => "Echo/sleep/exec directives",
      "eval"                => "Evaluate upstream response into vars",
      "extended-status"     => "Extended stub status",
      "fancyindex"          => "Fancy directory index",
      "geoip2"              => "GeoIP2",
      "headers-more"        => "Set/clear arbitrary response headers",
      "healthcheck"         => "Upstream health check",
      "http-accounting"     => "Per-host traffic accounting",
      "http-flood-detector" => "HTTP flood detector",
      "http-remote-passwd"  => "Basic auth password as variable",
      "log-if"              => "Conditional access logging",
      "lua"                 => "Lua scripting (requires ngx-devel-kit)",
      "mod-zip"             => "On-the-fly ZIP archives",
      "mogilefs"            => "MogileFS client",
      "mp4-h264"            => "H264 streaming",
      "mruby"               => "MRuby scripting (requires ngx-devel-kit)",
      "naxsi"               => "NAXSI WAF",
      "nchan"               => "Pub/sub server",
      "njs"                 => "njs scripting",
      "notice"              => "Maintenance notice pages",
      "php-session"         => "PHP session parser",
      "push-stream"         => "HTTP push stream",
      "realtime-req"        => "Per-vhost realtime request counter",
      "redis"               => "Redis upstream (keepalive)",
      "redis2"              => "Redis 2.0 protocol upstream",
      "rtmp"                => "RTMP media streaming",
      "set-misc"            => "Set-misc utilities (requires ngx-devel-kit)",
      "small-light"         => "Dynamic image transforms",
      "stream-lua"          => "Lua scripting in stream/TCP context",
      "subs-filter"         => "Regex/string substitution filter",
      "tarantool"           => "Tarantool upstream",
      "tcp-proxy"           => "TCP proxy and health check",
      "txid"                => "Sortable unique request ID",
      "unzip"               => "Serve files from ZIP archives",
      "upload"              => "Multipart file upload handler",
      "upload-progress"     => "Upload progress tracking",
      "upstream-check"      => "Upstream health check (active)",
      "upstream-order"      => "Upstream selection order",
      "ustats"              => "HAProxy-style upstream statistics",
      "var-req-speed"       => "Request speed variable",
      "vod"                 => "VOD MP4 repackager",
      "vts"                 => "Virtual host traffic status",
      "websockify"          => "WebSocket-to-TCP proxy",
      "xsltproc"            => "XSLT transformations",
    }
  end

  # Modules that pull in ngx-devel-kit at build time
  NDK_USERS = %w[set-misc lua array-var mruby].freeze

  deprecated_option "with-spdy"        => "with-http2"
  deprecated_option "with-degredation" => "with-degradation"

  core_modules.each do |arr|
    option "with-#{arr[0]}", "Build with #{arr[2]} module"
  end

  third_party_modules.each do |name, desc|
    option "with-#{name}-module", "Build with #{desc}"
    depends_on "#{name}-nginx-module" if build.with?("#{name}-module")
  end

  depends_on "ngx-devel-kit" if NDK_USERS.any? { |m| build.with?("#{m}-module") }
  depends_on "openssl@3"
  depends_on "pcre2"
  depends_on "pcre"        if build.with?("lua-module") || build.with?("stream-lua-module")
  depends_on "luajit"      if build.with?("lua-module") || build.with?("stream-lua-module")
  depends_on "gd"          if build.with?("image-filter")
  depends_on "libxml2"     if build.with?("xslt") || build.with?("dav-ext-module")
  depends_on "libxslt"     if build.with?("xslt")
  depends_on "libzip"      if build.with?("unzip-module")
  depends_on "gperftools"  if build.with?("google-perftools")
  depends_on "passenger"   if build.with?("passenger")
  depends_on "perl"        if build.with?("perl")
  depends_on "valgrind"    if build.with?("no-pool-nginx")

  conflicts_with "nginx", because: "nginx-full installs the same binary"

  # Patch-based integrations: these modify nginx internals and cannot be
  # dynamic modules. The corresponding formula only provides source to pkgshare.
  if build.with?("no-pool-nginx")
    patch :p2 do
      url "https://raw.githubusercontent.com/openresty/no-pool-nginx/master/nginx-1.11.2-no_pool.patch"
      sha256 "c0d3b663261c6cbbc02b1919362f351280f63490a18f8044e8d8e53def97c687"
    end
  end

  if build.with?("extended-status-module")
    patch do
      url "https://raw.githubusercontent.com/nginx-modules/ngx_http_extended_status_module/master/extended_status-1.10.1.patch"
      sha256 "d1215d0471d5cf9d52fedc1805d947c439bc8947ec178260a7931316224b435c"
    end
  end

  if build.with?("ustats-module")
    patch do
      url "https://raw.githubusercontent.com/nginx-modules/ngx_ustats_module/master/nginx-1.6.1.patch"
      sha256 "208516348117b470e965abc80e3cd4d0c0d3ee2d21b148b16030d8f9c87dd1d5"
    end
  end

  if build.with?("tcp-proxy-module")
    patch do
      url "https://raw.githubusercontent.com/yaoweibin/nginx_tcp_proxy_module/afcab76/tcp_1_8.patch"
      sha256 "78f6718294c914123fe377141e3b18be1014d79de6e5df20c5187a16fe58109d"
    end
  end

  skip_clean "logs"

  def install
    if build.with?("http-flood-detector-module") && build.without?("status")
      odie "--with-http-flood-detector-module requires --with-status"
    end

    if build.with?("dav-ext-module") && build.without?("webdav")
      odie "--with-dav-ext-module requires --with-webdav"
    end

    if build.with?("stream-lua-module") && build.without?("stream")
      odie "--with-stream-lua-module requires --with-stream"
    end

    if build.with?("small-light-module")
      small_light = Formula["small-light-nginx-module"]
      img_opts = build.used_options.select { |o| %w[with-gd with-imlib2].include?(o.name) }
      origin_dir = Dir.pwd
      Dir.chdir "#{small_light.share}/#{small_light.name}"
      system "./setup", *img_opts
      raise "small-light setup failed to produce config" unless File.exist?("./config")

      Dir.chdir origin_dir
    end

    if build.with?("mruby-module")
      ENV["NGX_MRUBY_LDFLAGS"] = "-lcrypto"
      mruby = Formula["mruby-nginx-module"]
      origin_dir = Dir.pwd
      Dir.chdir "#{mruby.share}/#{mruby.name}"
      system "git", "init"
      system "git", "submodule", "init"
      system "git", "submodule", "update"
      Dir.chdir "#{mruby.share}/#{mruby.name}/mruby"
      system "git", "add", "build_config.rb"
      system "git", "commit", "-m", "build_config.rb"
      Dir.chdir "#{mruby.share}/#{mruby.name}"
      system "./configure", "--with-ngx-src-root=#{buildpath}"
      system "make", "build_mruby"
      system "make", "generate_gems_config"
      rm_rf ".git"
      Dir.chdir origin_dir
    end

    inreplace "conf/nginx.conf" do |s|
      s.gsub! "listen       80;", "listen       8080;"
      s.gsub! "    #}\n\n}", "    #}\n    include servers/*;\n}"
    end

    ossl  = Formula["openssl@3"]
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{ossl.opt_include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{ossl.opt_lib}"

    if build.with?("lua-module") || build.with?("stream-lua-module")
      pcre = Formula["pcre"]
      cc_opt += " -I#{pcre.opt_include}"
      ld_opt += " -L#{pcre.opt_lib} -lpcre"
      luajit    = Formula["luajit"]
      luajit_ver = luajit.version.to_s.match(/\A(\d+\.\d+)/)[1]
      ENV["LUAJIT_INC"] = "#{luajit.opt_include}/luajit-#{luajit_ver}"
      ENV["LUAJIT_LIB"] = luajit.opt_lib.to_s
    else
      pcre2 = Formula["pcre2"]
      cc_opt += " -I#{pcre2.opt_include}"
      ld_opt += " -L#{pcre2.opt_lib}"
    end

    cc_opt += " -I#{Formula["libzip"].opt_lib}/libzip/include" if build.with?("unzip-module")

    args = %W[
      --prefix=#{prefix}
      --with-http_ssl_module
      --with-compat
      --with-pcre
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
      --modules-path=#{HOMEBREW_PREFIX}/lib/nginx/modules
    ]

    self.class.core_modules.each do |arr|
      args << "--with-#{arr[1]}" if arr[1] && build.with?(arr[0])
    end

    if NDK_USERS.any? { |m| build.with?("#{m}-module") }
      args << "--add-module=#{HOMEBREW_PREFIX}/share/ngx-devel-kit"
    end

    self.class.third_party_modules.each_key do |name|
      next unless build.with?("#{name}-module")
      share_path = name == "njs" \
        ? "#{HOMEBREW_PREFIX}/share/njs-nginx-module/nginx" \
        : "#{HOMEBREW_PREFIX}/share/#{name}-nginx-module"
      args << "--add-module=#{share_path}"
    end

    if build.with?("passenger")
      nginx_ext = `#{Formula["passenger"].opt_bin}/passenger-config --nginx-addon-dir`.chomp
      args << "--add-module=#{nginx_ext}"
    end

    system build.head? ? "./auto/configure" : "./configure", *args
    system "make", "install"
    man8.install build.head? ? "docs/man/nginx.8" : "man/nginx.8"

    (etc/"nginx/servers").mkpath
    (var/"run/nginx").mkpath
    (Pathname.new(HOMEBREW_PREFIX)/"lib/nginx/modules").mkpath
  end

  def post_install
    html = prefix/"html"
    dst  = var/"www"

    if dst.exist?
      html.rmtree
      dst.mkpath
    else
      dst.dirname.mkpath
      html.rename dst
    end

    prefix.install_symlink dst => "html"
    sbin.install_symlink bin/"nginx" if rack.subdirs.any? { |d| d.join("sbin").directory? }
  end

  def caveats
    s = <<~EOS
      Docroot:  #{var}/www
      Config:   #{etc}/nginx/nginx.conf
      Includes: #{etc}/nginx/servers/
      Modules:  #{HOMEBREW_PREFIX}/lib/nginx/modules/
      Port:     8080 (no root required)

      To load a dynamic module, add before the http block in nginx.conf:
        load_module modules/ngx_http_<name>_module.so;

      To run on port 80 (sets setuid bit once):
        sudo chown root:wheel #{bin}/nginx && sudo chmod u+s #{bin}/nginx
    EOS
    if build.with?("passenger")
      s += <<~EOS

        To activate Phusion Passenger, add inside the http block:
          passenger_root #{Formula["passenger"].opt_libexec}/src/ruby_supportlib/phusion_passenger/locations.ini;
          passenger_ruby /usr/bin/ruby;
      EOS
    end
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
    (testpath/"nginx.conf").write <<~EOS
      worker_processes 4;
      error_log #{testpath}/error.log;
      pid       #{testpath}/nginx.pid;
      events { worker_connections 1024; }
      http {
        client_body_temp_path #{testpath}/client_body_temp;
        fastcgi_temp_path     #{testpath}/fastcgi_temp;
        proxy_temp_path       #{testpath}/proxy_temp;
        scgi_temp_path        #{testpath}/scgi_temp;
        uwsgi_temp_path       #{testpath}/uwsgi_temp;
        server {
          listen 8080;
          root   #{testpath};
          access_log #{testpath}/access.log;
          error_log  #{testpath}/error.log;
        }
      }
    EOS
    system bin/"nginx", "-t", "-c", testpath/"nginx.conf"
  end
end

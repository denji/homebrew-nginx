class Openresty < Formula
  desc "Scalable Web Platform by Extending NGINX with Lua"
  homepage "https://openresty.org"
  license "BSD-2-Clause"
  url "https://openresty.org/download/openresty-1.25.3.2.tar.gz"
  sha256 "2d564022b06e33b45f7e5cfaf1e5dc571d38d61803af9fa2754dfff353c28d9c"

  option "with-debug",      "Compile with debug logging"
  option "with-postgresql", "Compile with ngx_http_postgres_module"
  option "with-iconv",      "Compile with ngx_http_iconv_module"
  option "with-slice",      "Compile with ngx_http_slice_module"

  depends_on "denji/nginx/openresty-openssl"
  depends_on "libmaxminddb"
  depends_on "pcre"
  depends_on "postgresql" => :optional

  conflicts_with "openresty-debug", because: "both install the same binaries"

  skip_clean "site", "pod", "nginx", "luajit"

  def install
    ossl = Formula["denji/nginx/openresty-openssl"]
    pcre = Formula["pcre"]

    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{pcre.opt_include} -I#{ossl.opt_include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{pcre.opt_lib} -L#{ossl.opt_lib}"

    args = %W[
      -j#{ENV.make_jobs}
      --prefix=#{prefix}
      --pid-path=#{var}/run/openresty.pid
      --lock-path=#{var}/run/openresty.lock
      --conf-path=#{etc}/openresty/nginx.conf
      --http-log-path=#{var}/log/nginx/access.log
      --error-log-path=#{var}/log/nginx/error.log
      --with-cc-opt=#{cc_opt}
      --with-ld-opt=#{ld_opt}
      --with-pcre-jit
      --without-http_rds_json_module
      --without-http_rds_csv_module
      --without-lua_rds_parser
      --with-stream
      --with-stream_ssl_module
      --with-stream_ssl_preread_module
      --with-http_v2_module
      --without-mail_pop3_module
      --without-mail_imap_module
      --without-mail_smtp_module
      --with-http_stub_status_module
      --with-http_realip_module
      --with-http_addition_module
      --with-http_auth_request_module
      --with-http_secure_link_module
      --with-http_random_index_module
      --with-http_gzip_static_module
      --with-http_sub_module
      --with-http_dav_module
      --with-http_flv_module
      --with-http_mp4_module
      --with-http_gunzip_module
      --with-threads
      --with-luajit-xcflags=-DLUAJIT_NUMMODE=2\ -DLUAJIT_ENABLE_LUA52COMPAT\ -fno-stack-check
    ]

    args << "--with-dtrace-probes"        if OS.mac?
    args << "--with-debug"                if build.with?("debug")
    args << "--with-http_postgres_module" if build.with?("postgresql")
    args << "--with-http_iconv_module"    if build.with?("iconv")
    args << "--with-http_slice_module"    if build.with?("slice")

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  service do
    run [opt_bin/"openresty", "-g", "daemon off;"]
    working_dir HOMEBREW_PREFIX
    keep_alive true
    log_path var/"log/openresty.log"
    error_log_path var/"log/openresty-error.log"
  end

  test do
    (testpath/"nginx.conf").write <<~EOS
      worker_processes 1;
      error_log #{testpath}/error.log;
      pid       #{testpath}/openresty.pid;
      events    { worker_connections 64; }
      http {
        server {
          listen 12080;
          location / { return 200 "ok"; }
        }
      }
    EOS
    system bin/"openresty", "-t", "-c", testpath/"nginx.conf"
  end
end

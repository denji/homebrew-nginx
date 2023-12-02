class Openresty < Formula
  desc "Scalable Web Platform by Extending NGINX with Lua"
  homepage "https://openresty.org"
  VERSION = "1.15.8.3".freeze
  url "https://openresty.org/download/openresty-#{VERSION}.tar.gz"
  sha256 "b68cf3aa7878db16771c96d9af9887ce11f3e96a1e5e68755637ecaff75134a8"
  revision 2

  option "with-debug", "Compile with support for debug logging"
  option "with-postgresql", "Compile with ngx_http_postgres_module"
  option "with-iconv", "Compile with ngx_http_iconv_module"
  option "with-slice", "Compile with ngx_http_slice_module"

  depends_on "denji/nginx/openresty-openssl"
  depends_on "geoip"
  depends_on "pcre"
  depends_on "postgresql" => :optional

  skip_clean "site"
  skip_clean "pod"
  skip_clean "nginx"
  skip_clean "luajit"

  def install
    # Configure
    cc_opt = "-I#{HOMEBREW_PREFIX}/include -I#{Formula["pcre"].opt_include}"
    cc_opt += " -I#{Formula["denji/nginx/openresty-openssl"].opt_include}"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib -L#{Formula["pcre"].opt_lib}"
    ld_opt += " -L#{Formula["denji/nginx/openresty-openssl"].opt_lib}"

    args = ["-j#{ENV.make_jobs}",
            "--prefix=#{prefix}",
            "--pid-path=#{var}/run/openresty.pid",
            "--lock-path=#{var}/run/openresty.lock",
            "--conf-path=#{etc}/openresty/nginx.conf",
            "--http-log-path=#{var}/log/nginx/access.log",
            "--error-log-path=#{var}/log/nginx/error.log",
            "--with-cc-opt=#{cc_opt}",
            "--with-ld-opt=#{ld_opt}",
            "--with-pcre-jit",
            "--without-http_rds_json_module",
            "--without-http_rds_csv_module",
            "--without-lua_rds_parser",
            "--with-ipv6",
            "--with-stream",
            "--with-stream_ssl_module",
            "--with-stream_ssl_preread_module",
            "--with-http_v2_module",
            "--without-mail_pop3_module",
            "--without-mail_imap_module",
            "--without-mail_smtp_module",
            "--with-http_stub_status_module",
            "--with-http_realip_module",
            "--with-http_addition_module",
            "--with-http_auth_request_module",
            "--with-http_secure_link_module",
            "--with-http_random_index_module",
            "--with-http_geoip_module",
            "--with-http_gzip_static_module",
            "--with-http_sub_module",
            "--with-http_dav_module",
            "--with-http_flv_module",
            "--with-http_mp4_module",
            "--with-http_gunzip_module",
            "--with-threads",
            "--with-luajit-xcflags=-DLUAJIT_NUMMODE=2 -DLUAJIT_ENABLE_LUA52COMPAT -fno-stack-check",
            "--with-dtrace-probes"]

    args << "--with-http_postgres_module" if build.with? "postgresql"
    args << "--with-http_iconv_module" if build.with? "iconv"
    args << "--with-http_slice_module" if build.with? "slice"
    args << "--with-debug" if build.with? "debug"

    system "./configure", *args

    # Install
    system "make"
    system "make", "install"
  end

  service do
    run [opt_bin/"openresty", "-g", "daemon off;"]
    working_dir HOMEBREW_PREFIX
    keep_alive false
  end

  test do
    system "#{bin}/openresty", "-V"
  end
end

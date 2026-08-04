class Geoip2NginxModule < Formula
  desc "GeoIP2 module for nginx"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  license "BSD-2-Clause"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/3.4.tar.gz"
  sha256 "ad72fc23348d715a330994984531fab9b3606e160483236737f9a4a6957d9452"

  # Builds a standalone .so (no nginx-full rebuild needed) and also drops
  # source into pkgshare so nginx-full can link it in statically instead
  # via --with-geoip2-module.
  NGINX_VERSION = "1.30.0"
  NGINX_SHA256  = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"

  depends_on "libmaxminddb"
  depends_on "openssl@3" => :build
  depends_on "pcre2"     => :build

  resource "nginx" do
    url "https://nginx.org/download/nginx-#{NGINX_VERSION}.tar.gz"
    sha256 NGINX_SHA256
  end

  def install
    pkgshare.install Dir["*"]

    ossl  = Formula["openssl@3"]
    pcre2 = Formula["pcre2"]
    cc_opt = "-I#{ossl.opt_include} -I#{pcre2.opt_include}"
    ld_opt = "-L#{ossl.opt_lib} -L#{pcre2.opt_lib}"
    module_src = buildpath

    resource("nginx").stage do
      system "./configure",
        "--with-compat",
        "--with-http_ssl_module",
        "--with-pcre",
        "--with-cc-opt=#{cc_opt}",
        "--with-ld-opt=#{ld_opt}",
        "--with-stream",
        "--with-stream_ssl_module",
        "--add-dynamic-module=#{module_src}"
      system "make", "modules"
      (lib/"nginx/modules").install Dir["objs/*.so"]
    end
  end

  def caveats
    <<~EOS
      Add to nginx.conf before the http block:
        load_module modules/ngx_http_geoip2_module.so;
        load_module modules/ngx_stream_geoip2_module.so;
    EOS
  end

  test do
    assert_predicate lib/"nginx/modules/ngx_http_geoip2_module.so", :exist?
    assert_predicate lib/"nginx/modules/ngx_stream_geoip2_module.so", :exist?
  end
end

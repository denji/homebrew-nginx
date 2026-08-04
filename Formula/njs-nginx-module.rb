class NjsNginxModule < Formula
  desc "njs scripting engine and nginx module"
  homepage "https://nginx.org/en/docs/njs/"
  license "BSD-2-Clause"
  url "https://github.com/nginx/njs/archive/0.8.9.tar.gz"
  sha256 "918accac7ec252baac1146e49fdc0f5c101c66ef3b9ceba7ce1b59be704acebf"
  head "https://github.com/nginx/njs.git", branch: "master"

  NGINX_VERSION = "1.30.0"
  NGINX_SHA256  = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"

  depends_on "pcre2"     => :build
  depends_on "readline"  => :build
  depends_on "openssl@3" => :build

  resource "nginx" do
    url "https://nginx.org/download/nginx-#{NGINX_VERSION}.tar.gz"
    sha256 NGINX_SHA256
  end

  def install
    # njs command-line binary
    system "./configure"
    system "make", "njs"
    bin.install "build/njs"

    # source tree for static linking into nginx-full
    pkgshare.install Dir["*"]

    # standalone dynamic .so
    ossl  = Formula["openssl@3"]
    pcre2 = Formula["pcre2"]
    cc_opt = "-I#{ossl.opt_include} -I#{pcre2.opt_include}"
    ld_opt = "-L#{ossl.opt_lib} -L#{pcre2.opt_lib}"
    module_src = "#{buildpath}/nginx"

    resource("nginx").stage do
      system "./configure",
        "--with-compat",
        "--with-http_ssl_module",
        "--with-pcre",
        "--with-cc-opt=#{cc_opt}",
        "--with-ld-opt=#{ld_opt}",
        "--add-dynamic-module=#{module_src}"
      system "make", "modules"
      (lib/"nginx/modules").install Dir["objs/*.so"]
    end
  end

  def caveats
    <<~EOS
      Add to nginx.conf before the http block:
        load_module modules/ngx_http_js_module.so;
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/njs -v 2>&1")
    assert_predicate lib/"nginx/modules/ngx_http_js_module.so", :exist?
  end
end

class BrotliNginxModule < Formula
  desc "Brotli compression module for nginx"
  homepage "https://github.com/google/ngx_brotli"
  license "BSD-2-Clause"

  # The stable tag tarball does not include the bundled brotli C library,
  # which ngx_brotli pulls in as a git submodule (deps/brotli). GitHub
  # archive tarballs never include submodule content. Use --HEAD to get
  # a working standalone .so build; the stable tarball still installs the
  # source tree for static linking into nginx-full.
  url "https://github.com/google/ngx_brotli/archive/refs/tags/v1.0.0rc.tar.gz"
  sha256 "c85cdcfd76703c95aa4204ee4c2e619aa5b075cac18f428202f65552104add3b"
  head "https://github.com/google/ngx_brotli.git", branch: "master"

  NGINX_VERSION = "1.30.0"
  NGINX_SHA256  = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"

  depends_on "openssl@3" => :build
  depends_on "pcre2"     => :build

  resource "nginx" do
    url "https://nginx.org/download/nginx-#{NGINX_VERSION}.tar.gz"
    sha256 NGINX_SHA256
  end

  def install
    system "git", "submodule", "update", "--init", "--recursive" if build.head?

    pkgshare.install Dir["*"]

    odie "brotli: use --HEAD until the stable tarball vendors deps/brotli" unless build.head?

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
        "--add-dynamic-module=#{module_src}"
      system "make", "modules"
      (lib/"nginx/modules").install Dir["objs/*.so"]
    end
  end

  def caveats
    <<~EOS
      Add to nginx.conf before the http block:
        load_module modules/ngx_http_brotli_filter_module.so;
        load_module modules/ngx_http_brotli_static_module.so;
    EOS
  end

  test do
    assert_predicate pkgshare, :exist?
    if build.head?
      assert_predicate lib/"nginx/modules/ngx_http_brotli_filter_module.so", :exist?
      assert_predicate lib/"nginx/modules/ngx_http_brotli_static_module.so", :exist?
    end
  end
end

class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.22.tar.gz"
  sha256 "294d3d4b2d14fda1b8c539ff86f90047d203df861eb9a1ac44ec5c679ef55408"
  head "https://github.com/openresty/lua-nginx-module.git", branch: "master"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end

  def post_install
    # configure script tries to write that file and fails
    # seems to be empty anyways, this hack makes compile succeed
    system "touch",  "#{pkgshare}/src/ngx_http_lua_autoconf.h"
  end
end

__END__
diff --git a/src/ngx_http_lua_headers_in.c b/src/ngx_http_lua_headers_in.c
index 7626d1f..db4d6a8 100644
--- a/src/ngx_http_lua_headers_in.c
+++ b/src/ngx_http_lua_headers_in.c
@@ -152,9 +152,15 @@ static ngx_http_lua_set_header_t  ngx_http_lua_set_handlers[] = {
                  ngx_http_set_builtin_header },
 #endif
 
+#if defined(nginx_version) && nginx_version >= 1023000
+    { ngx_string("Cookie"),
+                 offsetof(ngx_http_headers_in_t, cookie),
+                 ngx_http_set_builtin_multi_header },
+#else
     { ngx_string("Cookie"),
                  offsetof(ngx_http_headers_in_t, cookies),
                  ngx_http_set_builtin_multi_header },
+#endif
 
     { ngx_null_string, 0, ngx_http_set_header }
 };

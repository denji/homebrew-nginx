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

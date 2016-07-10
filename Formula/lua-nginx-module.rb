class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.5.tar.gz"
  sha256 "4f0292c37ab3d7cb980c994825040be1bda2c769cbd800e79c43eb37458347d4"
  head "https://github.com/openresty/lua-nginx-module.git"

  bottle :unneeded

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

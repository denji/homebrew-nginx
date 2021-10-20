class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.14.tar.gz"
  sha256 "9e17e086d0ac74fb72326abb7f2f8274c080b4981cbf358b026307b4088e7148"
  head "https://github.com/openresty/lua-nginx-module.git"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

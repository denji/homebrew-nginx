class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.20.tar.gz"
  sha256 "efeb38afc966dec36a086a99f9b8706b8a343e5e44d75c19bf8f017ea6657313"
  head "https://github.com/openresty/lua-nginx-module.git"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

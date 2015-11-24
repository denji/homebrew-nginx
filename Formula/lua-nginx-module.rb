class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.9.19.tar.gz"
  sha256 "2b41d4d2627fda76946f194aae6c2b4d89bb59afd792d397c6b481ee82c10eb4"
  head "https://github.com/openresty/lua-nginx-module.git"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

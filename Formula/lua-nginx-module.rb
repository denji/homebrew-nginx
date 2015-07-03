class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.9.16.tar.gz"
  sha256 "a3cda55b8cba5bc6632aa270b8a02d543fdb43f4d60a3bd2cb411c2a3b467656"
  head "https://github.com/openresty/lua-nginx-module.git"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

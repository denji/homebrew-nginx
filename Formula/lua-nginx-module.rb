class LuaNginxModule < Formula
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.9.15.tar.gz"
  sha1 "64879ba9912d2deaf81417ac9a2aca18fa56ff86"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

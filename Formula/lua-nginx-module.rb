class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.9.15.tar.gz"
  sha256 "659fe4c201f4a4ae1007fa029cef472aaa837bf0904babb6158f83b86536c5b7"
  head "https://github.com/openresty/lua-nginx-module.git"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.10.tar.gz"
  sha256 "b4acb84e2d631035a516d61830c910ef6e6485aba86096221ec745e0dbb3fbc9"
  head "https://github.com/openresty/lua-nginx-module.git"

  bottle :unneeded

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

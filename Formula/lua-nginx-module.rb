class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  stable do
    url "https://github.com/openresty/lua-nginx-module/archive/v0.10.8.tar.gz"
    sha256 "d67449c71051b3cc2d6dd60df0ae0d21fca08aa19c9b30c5b95ee21ff38ef8dd"
    patch do
      url "https://github.com/openresty/lua-nginx-module/pull/1017.patch"
      sha256 "93e7bf4460668ad3e5fbfd39f4ca25d29bd7975864b7f42749f94b51346e5166"
    end
  end
  revision 1
  head "https://github.com/openresty/lua-nginx-module.git"

  bottle :unneeded

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

class LuaNginxModule < Formula
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.9.13.tar.gz"
  sha1 "246ab53272d61f64eb0f61333847d0babfc0ff04"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

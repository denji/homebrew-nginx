class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.1rc0.tar.gz"
  version "0.10.1rc0"
  sha256 "1bae94d2a0fd4fad39f2544a2f8eaf71335ea512a6f0027af190b46562224c68"
  head "https://github.com/openresty/lua-nginx-module.git"

  bottle :unneeded

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  # feature: this module can now be built as a "dynamic module" with NGINX
  # feature: added HTTP 2.0 support to ngx.req.http_version().
  patch do
    url "https://github.com/openresty/lua-nginx-module/compare/v0.10.1rc0...01727a3.diff"
    sha256 "8e8a81d9b0e6691222be04f0bef5b4c15533a109badbccdc43d3aacf5e3b5019"
  end

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

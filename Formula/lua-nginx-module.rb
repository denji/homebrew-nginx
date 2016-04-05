class LuaNginxModule < Formula
  desc "Embed the power of Lua into Nginx"
  homepage "https://github.com/openresty/lua-nginx-module"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.2.tar.gz"
  sha256 "155feeff08a0b2efaf980705b9ef83d0b341e6d011adad8e2679ea4105668134"
  head "https://github.com/openresty/lua-nginx-module.git"

  bottle :unneeded

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  # bugfix: assignment to ngx.status might not affect subsequent
  # ngx.status reads when error_page had already taken place.
  #
  # bugfix: init_worker_by_lua* did not honor http {} top-level
  # configurations like lua_ssl_verify_depth and lua_ssl_trusted_certificate.
  patch do
    url "https://github.com/openresty/lua-nginx-module/compare/v0.10.2...d44f8e0.diff"
    sha256 "06eb7a0c69334ad16abd5334b00c45a568271d60d019e8de6b9ee0c8a49ae289"
  end

  def install
    (share+"lua-nginx-module").install Dir["*"]
  end
end

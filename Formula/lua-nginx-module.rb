class LuaNginxModule < Formula
  desc "Embed Lua scripting into nginx (static only - requires ngx-devel-kit)"
  homepage "https://github.com/openresty/lua-nginx-module"
  license "BSD-2-Clause"
  url "https://github.com/openresty/lua-nginx-module/archive/v0.10.26.tar.gz"
  sha256 "a75983287a2bdc5e964ace56a51b215dc2ec996639d4916cd393d6ebba94b565"
  head "https://github.com/openresty/lua-nginx-module.git", branch: "master"

  depends_on "luajit"
  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end

  def post_install
    autoconf_h = pkgshare/"src/ngx_http_lua_autoconf.h"
    autoconf_h.parent.mkpath
    FileUtils.touch(autoconf_h) unless autoconf_h.exist?
  end
end

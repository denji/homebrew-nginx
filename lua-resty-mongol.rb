require 'formula'

class LuaRestyMongol < Formula

  homepage 'https://github.com/bigplum/lua-resty-mongol'
  url 'https://github.com/bigplum/lua-resty-mongol/archive/master.tar.gz'
  sha1 '24e28f15699c9970a1880ec3af4185e269b1c6e7'
  version 'devel'

  depends_on "luajit"

  def install
    system "make install PREFIX=/usr/local/opt/nginx-full"
  end

end

require 'formula'

class LuaRestyMongol < Formula

  homepage 'https://github.com/bigplum/lua-resty-mongol'
  url 'https://github.com/bigplum/lua-resty-mongol/archive/master.tar.gz'
  sha1 '24e28f15699c9970a1880ec3af4185e269b1c6e7'
  version 'devel'

  depends_on "luajit"

  def install
    dir = (share + '/lua-resty-mongol')
    dir.mkpath
    system "make install PREFIX=#{share}/lua-resty-mongol"
  end

end

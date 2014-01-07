require 'formula'

class LuaNginxModule < Formula
  homepage 'https://github.com/chaoslawful/lua-nginx-module'
  url 'https://github.com/chaoslawful/lua-nginx-module/archive/v0.8.5.tar.gz'
  sha1 'e7853e8f645f56bfb4347869528b33e0af23fed3'

  depends_on "luajit"

  def install
    (share+'lua-nginx-module').install Dir['*']
  end
end

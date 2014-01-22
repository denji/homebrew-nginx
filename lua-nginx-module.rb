require 'formula'

class LuaNginxModule < Formula
  homepage 'https://github.com/chaoslawful/lua-nginx-module'
  url 'https://github.com/chaoslawful/lua-nginx-module/archive/v0.9.4.tar.gz'
  sha1 '617d9dedcc8ca6758e77c4253c8de0080ae2c9ae'

  depends_on "luajit"
  depends_on 'ngx-devel-kit'

  def install
    (share+'lua-nginx-module').install Dir['*']
  end
end

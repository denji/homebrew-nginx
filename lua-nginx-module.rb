require 'formula'

class LuaNginxModule < Formula

  homepage 'https://github.com/chaoslawful/lua-nginx-module'
  url 'https://github.com/chaoslawful/lua-nginx-module/archive/v0.8.3.tar.gz'
  sha1 '2c1ad0a2a3018fe85322430ff0c824e5edf9b37d'

  depends_on "luajit"

  def install
    (share+'lua-nginx-module').install Dir['*']
  end

  test do
    system "false"
  end
end

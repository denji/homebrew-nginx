require 'formula'

class LuaNginxModule < Formula

  homepage 'https://github.com/chaoslawful/lua-nginx-module'
  url 'https://github.com/chaoslawful/lua-nginx-module/archive/v0.8.1.tar.gz'
  sha1 '05b5c3904a0e674f6dd3980ba6d210fbae91b38e'

  depends_on "luajit"

  def install
    (share+'lua-nginx-module').install Dir['*']
  end

  test do
    system "false"
  end
end

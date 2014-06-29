require 'formula'

class EchoNginxModule < Formula
  homepage 'https://github.com/openresty/echo-nginx-module'
  url 'https://github.com/openresty/echo-nginx-module/archive/v0.53.tar.gz'
  sha1 'c0990ff6667977359c79fe28f55651b39923fded'

  def install
    (share+'echo-nginx-module').install Dir['*']
  end
end

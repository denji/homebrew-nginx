require "formula"

class Ctpp2NginxModule < Formula
  homepage "http://ngx-ctpp.vbart.ru/"
  url "http://dl.vbart.ru/ngx-ctpp/ngx_ctpp2-0.5.tar.gz"
  sha1 "b8faa0366654b5616e8182a5078daff2c36e712c"

  def install
    (share+"ctpp2-nginx-module").install Dir["*"]
  end
end

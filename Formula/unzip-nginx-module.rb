require "formula"

class UnzipNginxModule < Formula
  homepage "https://github.com/youzee/nginx-unzip-module"
  url "https://github.com/youzee/nginx-unzip-module/archive/03e582a2e99d2dd4bbd7f26d3f3d4a8e4a5d23f4.tar.gz"
  sha1 "b6f97d46d114ca432162dc909f34f6d4a2741c1b"
  version "0.1"
  revision 1

  def install
    (share+"unzip-nginx-module").install Dir["*"]
  end
end

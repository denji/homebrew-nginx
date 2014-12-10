require "formula"

class UnzipNginxModule < Formula
  homepage "https://github.com/youzee/nginx-unzip-module"
  url "https://github.com/youzee/nginx-unzip-module/archive/03e582a2e99d2dd4bbd7f26d3f3d4a8e4a5d23f4.tar.gz"
  sha1 "624cfc61fc4bb4f76c28f5590377897c04538f5b"
  version "0.1-pre"

  def install
    (share+"unzip-nginx-module").install Dir["*"]
  end
end

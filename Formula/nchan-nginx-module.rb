class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.94.tar.gz"
  sha256 "e4006c5f48399a753b1fc9de061d80b1a339198a8be2c8c460e8a4af40f7c2fc"

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
  
  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

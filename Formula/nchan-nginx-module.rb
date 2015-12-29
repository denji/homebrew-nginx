class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.95.tar.gz"
  sha256 "c852b82f27e9b228f13cd3806826d922b87d69e755e4019f632e1d7d04301fe9"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
  
  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

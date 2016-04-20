class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.99.13.tar.gz"
  sha256 "edc1b8564a22e141e2f586c38f598da935cfd6f8894db699cfb72759d0ac7a03"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

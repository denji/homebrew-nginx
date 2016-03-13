class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.99.8.tar.gz"
  sha256 "3b25cbd7aff9742dac15d64d55f67a4ab83fc52053111ddd3fd0b8f2932682d1"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

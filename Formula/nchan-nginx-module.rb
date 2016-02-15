class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.99.5.tar.gz"
  sha256 "24e0bd3489aed50a5f43c3541723a5ed5d52f7750e967c4f16e62f5eddc6af2e"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

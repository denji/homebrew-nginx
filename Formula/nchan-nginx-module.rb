class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.7.tar.gz"
  sha256 "bef0cfd86e96f5b566fa79b130049bee0dd350a0e64ad673530a83eb7231c2ca"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

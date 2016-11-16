class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.6.tar.gz"
  sha256 "3e1d192fec382c0094ed805753f8f65b0739f4bcb5b0fae9c089e9898f702f26"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

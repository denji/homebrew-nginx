class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.1.10.tar.gz"
  sha256 "6daff7b41e31e6d860a6ee6bbfcd7b6c12fccafe9986bda2905263c5215f374b"
  head "https://github.com/slact/nchan.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

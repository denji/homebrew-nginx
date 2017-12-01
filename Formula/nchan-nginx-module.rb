class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.1.12.tar.gz"
  sha256 "8f3506b6bf8cdab53c50bcf1fb4420a33ee6f14903abc8cd0c40f72131a878bb"
  head "https://github.com/slact/nchan.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

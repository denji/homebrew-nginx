class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.2.0.tar.gz"
  sha256 "c13438c045521d7865f51e4cb842fc0f16758634a8c50c9fee90846a46d60dc9"
  head "https://github.com/slact/nchan.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

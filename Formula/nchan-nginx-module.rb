class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.2.1.tar.gz"
  sha256 "7bb3ae57a036afabee1da5e40085b69b3fd68026fcc1d8abc98a8ad9f5dccc44"
  head "https://github.com/slact/nchan.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

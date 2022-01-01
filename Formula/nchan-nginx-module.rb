class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.2.15.tar.gz"
  sha256 "dbb05bec6a4cf6ad1c1a4e613a2c832669c0eb87847e70ab26bc6c590361a818"
  head "https://github.com/slact/nchan.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

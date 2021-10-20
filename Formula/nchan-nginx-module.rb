class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.2.7.tar.gz"
  sha256 "8bb5d1749af759bb5e9cc5476a9c4b44d51bee6096bb89ab5ff53e85367b490b"
  head "https://github.com/slact/nchan.git"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

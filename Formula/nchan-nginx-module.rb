class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.2.14.tar.gz"
  sha256 "d4280b83524ec0bbd794ee46e347f990fc1063e1849e41755c128b6e07371ac9"
  head "https://github.com/slact/nchan.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

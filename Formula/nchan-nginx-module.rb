class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.3.6.tar.gz"
  sha256 "ba0b7cc6b710a20ce1ed2554caf56154035291aaf115e407d7a6bb699fde42df"
  head "https://github.com/slact/nchan.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

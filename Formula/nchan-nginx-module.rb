class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.io"
  head "https://github.com/slact/nchan.git"
  url "https://github.com/slact/nchan/archive/v1.1.4.tar.gz"
  sha256 "8d7299c1b78e87c7970fc9656446ffa88d0ebc6abd2788cb067326cae355f36a"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

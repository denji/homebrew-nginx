class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.io"
  head "https://github.com/slact/nchan.git"
  url "https://github.com/slact/nchan/archive/v1.1.5.tar.gz"
  sha256 "b376a79321bd920ac4babb3f3d699198caac017aec24ca333d7361c40760e7c2"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

class NchanNginxModule < Formula
  desc "Fast, flexible pub/sub server"
  homepage "https://nchan.io"
  url "https://github.com/slact/nchan/archive/v1.1.13.tar.gz"
  sha256 "8e869ea92fd885f5d9755f926e809ee81ca21967044b98e9932a8eb661d91709"
  head "https://github.com/slact/nchan.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?(pkgshare)
  end
end

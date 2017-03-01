class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.1.2.tar.gz"
  sha256 "ff844b922ddfed81b428ada72cdeeb1ac56b8836c3b5cb3c2118784cc163e208"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

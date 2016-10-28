class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.4.tar.gz"
  sha256 "212e973a6fda6ce82344815baf6d2324200d1b5c49ac9c34cfc6f0fb5ebcafbb"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

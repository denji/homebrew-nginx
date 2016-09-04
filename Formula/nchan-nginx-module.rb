class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.3.tar.gz"
  sha256 "24abe863ed1d3bfeb220393a8dc18a6961bab45172ac2a510d3e2e63a2469edb"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

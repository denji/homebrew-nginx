class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.2.tar.gz"
  sha256 "3beb15825e1d36cb606cb1db490cadf390a8df78b7ddf8799bb1efc7afc5a4df"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

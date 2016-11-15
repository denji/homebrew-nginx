class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.5.tar.gz"
  sha256 "f767562f14cfcae9de43c825711820ebea20f4f9e7c2992ecbc07cf9400de667"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

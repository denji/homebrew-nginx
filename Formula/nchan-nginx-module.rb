class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.8.tar.gz"
  sha256 "bed48ad09a1655f7e938e60be248b38347728e35ac4b9970d317cf5f57429447"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

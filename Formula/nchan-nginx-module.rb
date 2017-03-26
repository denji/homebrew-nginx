class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.io"
  head "https://github.com/slact/nchan.git"
  url "https://github.com/slact/nchan/archive/v1.1.3.tar.gz"
  sha256 "8bee9eb6cf69b90f84af2657a9c0648b100e6027007638a895a511fe5a600cdd"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

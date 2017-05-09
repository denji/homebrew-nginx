class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.io"
  head "https://github.com/slact/nchan.git"
  url "https://github.com/slact/nchan/archive/v1.1.6.tar.gz"
  sha256 "df037766e3a152d8cf2a8b644dd10db8cac3679523adc3c063d41ffeb20d43bc"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

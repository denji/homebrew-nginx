class UnzipNginxModule < Formula
  desc "fetching of files that are stored in zipped archives"
  homepage "https://github.com/youzee/nginx-unzip-module"
  url "https://github.com/youzee/nginx-unzip-module/archive/03e582a.tar.gz"
  version "0.1"
  sha256 "49a0bd04ac632842e24c5bbb2fdd9ebe3aa6a753efd5b7e71eb273e5973a5cee"
  revision 1

  def install
    pkgshare.install Dir["*"]
  end
end

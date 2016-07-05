class ModZipNginxModule < Formula
  desc "ZIP archiver for nginx"
  homepage "https://github.com/evanmiller/mod_zip"
  url "https://github.com/evanmiller/mod_zip/archive/35ea7ff.tar.gz"
  version "0.1"
  sha256 "2198071ea1d25a861407745a0a99fffba6cc2784e9a79cabf5a6273f0ff478d1"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

class ModZipNginxModule < Formula
  desc "ZIP archiver for nginx"
  homepage "https://github.com/evanmiller/mod_zip"
  url "https://github.com/evanmiller/mod_zip/archive/refs/tags/1.3.0.zip"
  version "1.3.0"
  sha256 "fb08c0d74e0519aaede52837374ec1f136e456589698fd674cbafccab0941614"

  def install
    pkgshare.install Dir["*"]
  end
end

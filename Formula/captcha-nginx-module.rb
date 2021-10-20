class CaptchaNginxModule < Formula
  desc "Captcha module for nginx"
  homepage "https://github.com/fallgold/ngx_http_captcha"
  url "https://github.com/fallgold/ngx_http_captcha/archive/0fbd025edb.tar.gz"
  version "0.1"
  sha256 "35e701afd0343a7fe167df6b3d546d4a8589e6d5ff1aa9064a8f9ebd936cc50b"

  depends_on "imagemagick"

  def install
    pkgshare.install Dir["*"]
  end
end

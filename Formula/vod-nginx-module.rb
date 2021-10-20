class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.24.tar.gz"
  sha256 "b3cad8e3047556955fa028bcc68e7af46d19343942cb7984ad25e6f44d614ddf"

  def install
    pkgshare.install Dir["*"]
  end
end

class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.31.tar.gz"
  sha256 "ace04201cf2d2b1a3e5e732a22b92225b8ce61a494df9cc7f79d97efface8952"

  def install
    pkgshare.install Dir["*"]
  end
end

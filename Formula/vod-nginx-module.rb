class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.9.tar.gz"
  sha256 "af98d03a8d153bc57301f312b015efb25d7955d777af93d5b630d7a944b67e8f"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

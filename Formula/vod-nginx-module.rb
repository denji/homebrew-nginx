class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.17.tar.gz"
  sha256 "ee824c8b2986edaafcd746ab18c94ce0effbc0d22fe60a680d867ee30839b9c2"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

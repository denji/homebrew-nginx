class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.19.tar.gz"
  sha256 "ea71c02fc9257463a3cb579db7dc2c76fbc4dd1b2657551bf6d78ec722be99bf"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

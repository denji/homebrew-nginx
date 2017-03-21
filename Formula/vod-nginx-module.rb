class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.15.tar.gz"
  sha256 "9e5ba4bb05911b1076cf391d501b500cf029f9337e0a39aea2b7ea8808c0613e"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

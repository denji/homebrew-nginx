class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.18.tar.gz"
  sha256 "cba0673725f66279671d9dc0ac7bea6ea78cf963ce1b6582320d10a857a818d3"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

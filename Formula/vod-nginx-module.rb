class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.10.tar.gz"
  sha256 "451fbd8e0ff5c6234d23a198f307ed47803bb7d666f5af9eb868fb43dcb2d4ec"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

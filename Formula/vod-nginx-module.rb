class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.11.tar.gz"
  sha256 "afd79000404e12cfc980ec7cd368d12fd32e09ad867f72fd800b8835d45ab36e"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

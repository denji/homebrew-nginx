class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/6235931af.tar.gz"
  version "1.4"
  sha256 "6235931af9d3fa6ded1bd380867649f73cacacae"

  def install
    (share+"vod-nginx-module").install Dir["*"]
  end
end

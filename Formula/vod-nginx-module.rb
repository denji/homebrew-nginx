class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.29.tar.gz"
  sha256 "775898874367900f14b6197366501c782e8c86dd2b0c3cc45973abf4e8a9217c"

  def install
    pkgshare.install Dir["*"]
  end
end

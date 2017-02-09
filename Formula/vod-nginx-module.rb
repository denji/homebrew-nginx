class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.13.tar.gz"
  sha256 "f375dff563dc5df1f6eb8e7feb09b7387ff670ea866570c68b66d5b1f1b5835d"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

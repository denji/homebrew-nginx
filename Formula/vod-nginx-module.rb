class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.16.tar.gz"
  sha256 "c610c52d419a6982a70b54c81ba8f9b8bd4854bafaf2750ad5c8e7de23f7721d"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

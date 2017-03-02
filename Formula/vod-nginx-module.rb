class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.14.tar.gz"
  sha256 "8034936d378b3487d3f2818f84141fe33f825bd8e127ca841292a4b445cbf040"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.12.tar.gz"
  sha256 "d1a0b86517dccdee82bdb3e52510aee391c5de58d9568003b36f2be739addfb0"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

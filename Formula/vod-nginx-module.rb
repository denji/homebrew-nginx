class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.23.tar.gz"
  sha256 "800cf3de639567e27f4cb75527392f23842b349fb680abefd12d4db9a5be951f"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

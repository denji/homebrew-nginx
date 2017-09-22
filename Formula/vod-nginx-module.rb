class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.20.tar.gz"
  sha256 "4481cad931c322f8e0a8be2edbcea722faad0fcd5365830bec062208650930be"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

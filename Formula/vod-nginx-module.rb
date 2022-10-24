class VodNginxModule < Formula
  desc "DRM on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.30.tar.gz"
  sha256 "db1a7b31b4109eff32519f6624eaa54815db79f8e8b671bd24e5906ea5b3b905"

  def install
    pkgshare.install Dir["*"]
  end
end

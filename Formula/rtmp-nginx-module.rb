class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

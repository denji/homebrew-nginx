class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"
  version "1.1.7.11-dev"
  revision 1
  
  patch do
    url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/compare/v1.1.7.10...d25c56f.diff"
    sha256 "621d406f20195400603f492ec785ea1c01af04e877bc84c1aeb40487d27dcc13"
  end

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

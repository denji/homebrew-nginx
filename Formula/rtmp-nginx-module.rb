class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.2.2-r1.tar.gz"
  version "1.2.2-r1"
  sha256 "60b1743bd4b3450880bcd28396ce7d416c04d17d213873a490177fc83bb12211"
  revision 3

  def install
    pkgshare.install Dir["*"]
  end
end

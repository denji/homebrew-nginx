class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"
  version "1.1.7.11-dev"
  revision 3

  patch do
    url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/compare/v1.1.7.10...504b9ee.diff"
    sha256 "0e46216f50edd59d1f549aa9496ecee9ef06c558d9c21d9a65f509679ff3267c"
  end

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

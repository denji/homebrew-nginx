class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"
  version "1.1.7.11-dev"
  revision 3

  patch do
    url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/compare/v1.1.7.10..504b9ee.diff"
    sha256 "afa7a32135bc522383b1c1ad9d32284856b7b59113401a5ad00039da015f66e3"
  end

  def install
    pkgshare.install Dir["*"]
  end
end

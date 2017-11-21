class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"
  version "1.1.7.11-dev"
  revision 2
  
  patch do
    url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/compare/v1.1.7.10...d25c56f.diff"
    sha256 "11991a7bedfb978813ef9f75cd05f8a2d74caed52d89683f8cdecce5515108cf"
  end

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

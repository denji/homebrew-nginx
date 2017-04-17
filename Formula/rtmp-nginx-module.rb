class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.10.tar.gz"
  sha256 "0b32d34704d038485d93656dc43e970bbdd9c63bca7ff3b81ad941cde9144fc6"
  version "1.1.7.11-dev"
  
  patch do
    url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/compare/v1.1.7.10...542106e.diff"
    sha256 "4bce367978d8dc2896432bc517f642626cc006256052957df37b94a6c9eb024b"
  end

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

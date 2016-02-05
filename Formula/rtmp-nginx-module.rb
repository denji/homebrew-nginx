class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module"
  url "https://github.com/sergey-dryabzhinsky/nginx-rtmp-module/archive/v1.1.7.9.tar.gz"
  sha256 "3966f96c745024a6d2a3ce97ab14d273e2d2fcbe4afe96848b189ad9a93065ac"

  bottle :unneeded

  def install
    (share/"rtmp-nginx-module").install Dir["*"]
  end
end

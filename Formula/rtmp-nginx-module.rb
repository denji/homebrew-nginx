class RtmpNginxModule < Formula
  desc "NGINX-based Media Streaming Server"
  homepage "https://github.com/arut/nginx-rtmp-module"
  url "https://github.com/arut/nginx-rtmp-module/archive/v1.1.7.tar.gz"
  sha256 "7922b0e3d5f3d9c4b275e4908cfb8f5fb1bfb3ac2df77f4c262cda56df21aab3"

  bottle :unneeded

  def install
    (share/"rtmp-nginx-module").install Dir["*"]
  end
end

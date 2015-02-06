class WebsockifyNginxModule < Formula
  homepage "https://github.com/tg123/websockify-nginx-module"
  url "https://github.com/tg123/websockify-nginx-module/archive/v0.0.2.tar.gz"
  sha1 "70a5eadcc744209f4f2737b6d987f4fa2e50e2ed"

  def install
    (share+"websockify-nginx-module").install Dir["*"]
  end
end

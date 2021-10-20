class WebsockifyNginxModule < Formula
  desc "Embed websockify into Nginx"
  homepage "https://github.com/tg123/websockify-nginx-module"
  url "https://github.com/tg123/websockify-nginx-module/archive/v0.0.3.tar.gz"
  sha256 "35494258f9db0b113d739f9262bae5a61808e117662fe788d1422282d1ce5672"

  def install
    pkgshare.install Dir["*"]
  end
end

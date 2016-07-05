class Geoip2NginxModule < Formula
  desc "Nginx GeoIP2 module"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/1.0.tar.gz"
  version "1.0"
  sha256 "7b1eacf92fe57ee6e33316f07e31bda440f24b3af9ab6b14dd109ac0c348d6c7"

  depends_on "libmaxminddb"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

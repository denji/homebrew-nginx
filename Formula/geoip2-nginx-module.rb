class Geoip2NginxModule < Formula
  desc "Nginx GeoIP2 module"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/3.3.tar.gz"
  sha256 "41378438c833e313a18869d0c4a72704b4835c30acaf7fd68013ab6732ff78a7"

  depends_on "libmaxminddb"

  def install
    pkgshare.install Dir["*"]
  end
end

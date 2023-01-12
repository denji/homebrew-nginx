class Geoip2NginxModule < Formula
  desc "Nginx GeoIP2 module"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/3.4.tar.gz"
  sha256 "ad72fc23348d715a330994984531fab9b3606e160483236737f9a4a6957d9452"

  depends_on "libmaxminddb"

  def install
    pkgshare.install Dir["*"]
  end
end

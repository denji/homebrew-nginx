class Geoip2NginxModule < Formula
  desc "Nginx GeoIP2 module"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/1.1.tar.gz"
  sha256 "efa446c10fa4d80ffe8b5e340d83db62474ae7eba091016032b754a1d17a6769"

  bottle :unneeded

  depends_on "libmaxminddb"

  def install
    pkgshare.install Dir["*"]
  end
end

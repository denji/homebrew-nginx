class Geoip2NginxModule < Formula
  desc "Nginx GeoIP2 module"
  homepage "https://github.com/leev/ngx_http_geoip2_module"
  url "https://github.com/leev/ngx_http_geoip2_module/archive/2.0.tar.gz"
  sha256 "ebb4652c4f9a2e1ee31fddefc4c93ff78e651a4b2727d3453d026bccbd708d99"

  depends_on "libmaxminddb"

  def install
    pkgshare.install Dir["*"]
  end
end

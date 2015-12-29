class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.26.tar.gz"
  sha256 "648e450ff48256919e948092e22dc9e17557f55311a669c5c72842a3d5ec1e79"

  bottle :unneeded

  def install
    (share+"headers-more-nginx-module").install Dir["*"]
  end
end

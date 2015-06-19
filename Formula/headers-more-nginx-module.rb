class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.26.tar.gz"
  sha256 "d6bdc51f9e778a3b23e41a51cae542c1467a1e5e55c1329a7ffc454be084fb6f"

  def install
    (share+"headers-more-nginx-module").install Dir["*"]
  end
end

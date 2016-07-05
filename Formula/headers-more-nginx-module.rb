class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.29.tar.gz"
  sha256 "0a5f3003b5851373b03c542723eb5e7da44a01bf4c4c5f20b4de53f355a28d33"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

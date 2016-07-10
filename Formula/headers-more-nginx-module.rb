class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.30.tar.gz"
  sha256 "2aad309a9313c21c7c06ee4e71a39c99d4d829e31c8b3e7d76f8c964ea8047f5"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

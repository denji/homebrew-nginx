class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.261.tar.gz"
  sha256 "03d1f5fbecba8565f247d87a38f5e4b6440b0a56d752bdd2b29af2f1c4aea480"

  def install
    pkgshare.install Dir["*"]
  end
end

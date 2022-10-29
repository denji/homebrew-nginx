class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.34.tar.gz"
  sha256 "0c0d2ced2ce895b3f45eb2b230cd90508ab2a773299f153de14a43e44c1209b3"

  def install
    pkgshare.install Dir["*"]
  end
end

class HeadersMoreNginxModule < Formula
  desc "Set, add, and clear arbitrary output headers"
  homepage "https://github.com/openresty/headers-more-nginx-module"
  url "https://github.com/openresty/headers-more-nginx-module/archive/v0.33.tar.gz"
  sha256 "a3dcbab117a9c103bc1ea5200fc00a7b7d2af97ff7fd525f16f8ac2632e30fbf"

  def install
    pkgshare.install Dir["*"]
  end
end

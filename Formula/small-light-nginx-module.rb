class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.6.tar.gz"
  sha256 "e7852ab5f480bc72f21939ffa5ddff7dcb04e4a6750d5b6ebac874f710bd6f6a"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

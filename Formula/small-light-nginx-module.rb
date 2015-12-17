class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.12.tar.gz"
  sha256 "4c1b7101f72073ee00254727c5d87c211b0a1504c6c5c52c2258eebbab5d38f1"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

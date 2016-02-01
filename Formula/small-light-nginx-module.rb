class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.14.tar.gz"
  sha256 "cfba118f8e6b7771959c3b33658e24cd252941c5f9c5d6104c913e2f49049e68"

  bottle :unneeded

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

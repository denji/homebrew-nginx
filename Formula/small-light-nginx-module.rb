class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.13.tar.gz"
  sha256 "4f6ace8e8b72ebd28dfd7da66f29d1bbe340a6f8e4157215e2aeec50b3e4c5c7"

  bottle :unneeded

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

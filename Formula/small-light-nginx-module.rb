class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.7.tar.gz"
  sha256 "04dfc56b853b1ac3aaba155261795937c0da4e4d8811b4316963acaf0816d318"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

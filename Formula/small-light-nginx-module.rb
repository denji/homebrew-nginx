class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.7.3.tar.gz"
  sha256 "3e01d3c5e581c5a6083a9408dd1d54dde52a02e2894e2c4fcfda05b127ad0bf0"

  bottle :unneeded

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

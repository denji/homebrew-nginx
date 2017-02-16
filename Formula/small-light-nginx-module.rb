class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.9.1.tar.gz"
  sha256 "08ee0dec308d3ebaa01871e36c0516739366d0481bac957dd7878ee948c0d42e"

  bottle :unneeded

  depends_on "imagemagick@6"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

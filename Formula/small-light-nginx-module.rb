class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.8.0.tar.gz"
  sha256 "8f513d6d3df32c3b05327d40e16efd020532a911d3eeca8015eb6271f2d4fd1c"

  bottle :unneeded

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

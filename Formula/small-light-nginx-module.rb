class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.9.0.tar.gz"
  sha256 "5dde5fb5bc32bb943638c06fb94d7ef30eb4af1145e168e54e91c9bb45456776"

  bottle :unneeded

  depends_on "imagemagick@6"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

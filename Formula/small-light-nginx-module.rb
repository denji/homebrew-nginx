class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.9.tar.gz"
  sha256 "5d4e3d4fec3968ee57a5fa066118649e2b994b3f3a293896e62bf690b726b7fb"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

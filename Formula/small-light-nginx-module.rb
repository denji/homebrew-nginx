class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.10.tar.gz"
  sha256 "6da8c8c43ff0c20b292b246b512012617bde810d6f5a4fada3723b9764d4b16a"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

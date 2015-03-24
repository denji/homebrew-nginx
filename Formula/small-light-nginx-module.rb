class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.6.tar.gz"
  sha1 "460354c5ff91f8b8f0a5aff435889f0b5d9648cb"
  version "0.6.6"

  option "with-gd", "enable GD"
  option "with-imlib2", "enable Imlib2"

  depends_on "pkg-config"
  depends_on "imagemagick"
  depends_on "gd" if build.with? "gd"
  depends_on "imlib2" if build.with? "imlib2"

  def install
    args = []

    if build.with? "gd"
      args << "--with-gd"
    end
    if build.with? "imlib2"
      args << "--with-imlib2"
    end
    system "./setup", *args
    (share+"small-light-nginx-module").install Dir["*"]
  end
end

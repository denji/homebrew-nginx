class SmallLightNginxModule < Formula
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.6.6.tar.gz"
  sha256 "e7852ab5f480bc72f21939ffa5ddff7dcb04e4a6750d5b6ebac874f710bd6f6a"

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build
  depends_on "gd" => :optional
  depends_on "imlib2" => :optional

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

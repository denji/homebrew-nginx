class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.9.2.tar.gz"
  sha256 "4cf660651d11330a13aab29eb1722bf792d7c3c42e2919a36a1957c4ed0f1533"

  depends_on "pkg-config" => :build
  depends_on "imagemagick@6"
  depends_on "pcre"

  def install
    pkgshare.install Dir["*"]
  end
end

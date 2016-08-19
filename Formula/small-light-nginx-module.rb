class SmallLightNginxModule < Formula
  desc "Dynamic image transformation module"
  homepage "https://github.com/cubicdaiya/ngx_small_light"
  url "https://github.com/cubicdaiya/ngx_small_light/archive/v0.8.1.tar.gz"
  sha256 "0aacb02ca2fef6b6ed3aac242f5cda2aeefc010066d38975c2f82d526f5d4cbd"

  bottle :unneeded

  depends_on "imagemagick"
  depends_on "pcre"
  depends_on "pkg-config" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli.git"

  # There are no tags in google/ngx_brotli, this is the latest commit as of 20171122
  url "https://github.com/google/ngx_brotli/archive/bfd2885b2da4d763fed18f49216bb935223cd34b.tar.gz"
  version "bfd2885b2d"
  sha256 "3a5348d484554f3d1787d06961fc7886fda44d17264ab7e6cdf1f4a8fa04231e"

  head "https://github.com/google/ngx_brotli.git"

  bottle :unneeded

  depends_on "brotli"

  def install
    pkgshare.install Dir["*"]
  end
end

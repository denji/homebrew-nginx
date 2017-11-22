class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"

  # There are no tags in google/ngx_brotli, this is the latest commit as of 20171122
  url "https://github.com/google/ngx_brotli/archive/bfd2885b2da4d763fed18f49216bb935223cd34b.tar.gz"
  version "bfd2885b2d"
  sha256 "3a5348d484554f3d1787d06961fc7886fda44d17264ab7e6cdf1f4a8fa04231e"

  head "https://github.com/google/ngx_brotli.git"

  bottle :unneeded

  depends_on "brotli"

  # Define main brotli package as a resource
  resource "brotli-devel" do
    url "https://github.com/google/brotli/archive/v1.0.1.tar.gz"
    sha256 "6870f9c2c63ef58d7da36e5212a3e1358427572f6ac5a8b5a73a815cf3e0c4a6"
  end

  def deps_dir
    pkgshare/"deps/brotli"
  end

  def install
    pkgshare.install Dir["*"]

    # Install the main brotli package to deps/brotli
    resource("brotli-devel").stage { deps_dir.install Dir["*"] }
  end
end

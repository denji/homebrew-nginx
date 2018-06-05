class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"

  # There are no tags in eustas/ngx_brotli, this is the latest commit as of 20171122
  url "https://github.com/eustas/ngx_brotli/archive/47550a25d07363f8eb87ef901b2de5883c46352b.tar.gz"
  version "47550a25d0"
  sha256 "3ef9af9c8da372e1e1e7effc85aec7476c61ba3544281600259e746e011d1a25"

  head "https://github.com/eustas/ngx_brotli.git"

  bottle :unneeded

  depends_on "brotli"

  # Define main brotli package as a resource
  resource "brotli-devel" do
    url "https://github.com/google/brotli/archive/3af18990f50d8f040038aaa08c41f5d27d62efb5.tar.gz"
    sha256 "e8c67eed3aa003b5b4e29a050913ec258fa67da6ea7c979ef30efea11a00d791"
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

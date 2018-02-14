class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"

  # There are no tags in google/ngx_brotli, this is the latest commit as of 20171122
  # url "https://github.com/google/ngx_brotli/archive/bfd2885b2da4d763fed18f49216bb935223cd34b.tar.gz"
  # version "bfd2885b2d"
  # sha256 "3a5348d484554f3d1787d06961fc7886fda44d17264ab7e6cdf1f4a8fa04231e"
  url "https://github.com/eustas/ngx_brotli/archive/47550a25d07363f8eb87ef901b2de5883c46352b.tar.gz"
  version "47550a25d0"
  sha256 "3ef9af9c8da372e1e1e7effc85aec7476c61ba3544281600259e746e011d1a25"

  # head "https://github.com/google/ngx_brotli.git"
  head "https://github.com/eustas/ngx_brotli.git"

  bottle :unneeded

  depends_on "brotli"

  # Define main brotli package as a resource
  resource "brotli-devel" do
    # url "https://github.com/google/brotli/archive/222564a95d9ab58865a096b8d9f7324ea5f2e03e.tar.gz"
    # sha256 "4299a2a86f0b931e80dd548be17fcaa5a6c158a0727f497f22cbb365668af0fe"
    url "https://github.com/google/brotli/archive/5b4769990dc14a2bd466d2599c946c5652cba4b2.tar.gz"
    sha256 "3a3c53b56a961ba24d331a5b7882b0bec7f2e3c7be7cf77b9db18271c28151ce"
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

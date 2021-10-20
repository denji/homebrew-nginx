class SetMiscNginxModule < Formula
  desc "Rewrite module md5/sha1, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.32.tar.gz"
  sha256 "f1ad2459c4ee6a61771aa84f77871f4bfe42943a4aa4c30c62ba3f981f52c201"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

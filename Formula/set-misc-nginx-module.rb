class SetMiscNginxModule < Formula
  desc "Rewrite module md5/sha1, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.31.tar.gz"
  sha256 "97946a68937b50ab8637e1a90a13198fe376d801dc3e7447052e43c28e9ee7de"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

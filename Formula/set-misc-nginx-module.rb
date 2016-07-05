class SetMiscNginxModule < Formula
  desc "Rewrite module md5/sha1, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.29.tar.gz"
  sha256 "8d280fc083420afb41dbe10df9a8ceec98f1d391bd2caa42ebae67d5bc9295d8"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

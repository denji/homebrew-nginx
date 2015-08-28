class SetMiscNginxModule < Formula
  desc "rewrite module md5/sha1, sql/json quoting, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.29.tar.gz"
  sha256 "8d280fc083420afb41dbe10df9a8ceec98f1d391bd2caa42ebae67d5bc9295d8"

  depends_on "ngx-devel-kit"

  def install
    (share+"set-misc-nginx-module").install Dir["*"]
  end
end

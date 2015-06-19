class SetMiscNginxModule < Formula
  desc "rewrite module md5/sha1, sql/json quoting, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.28.tar.gz"
  sha256 "cf06a976785446e0552beb1e11b8dff8a4973f7628935c4d2655812a03ceb60a"

  depends_on "ngx-devel-kit"

  def install
    (share+"set-misc-nginx-module").install Dir["*"]
  end
end

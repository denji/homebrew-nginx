class SetMiscNginxModule < Formula
  desc "Rewrite module md5/sha1, and many more"
  homepage "https://github.com/openresty/set-misc-nginx-module"
  url "https://github.com/openresty/set-misc-nginx-module/archive/v0.33.tar.gz"
  sha256 "cd5e2cc834bcfa30149e7511f2b5a2183baf0b70dc091af717a89a64e44a2985"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.17.0.tar.gz"
  sha256 "064758cfdcd9674914963d8bf86939e39e0c693e7783d68b307f4a156a1f9812"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    (share+"mruby-nginx-module").install Dir["*"]
  end
end

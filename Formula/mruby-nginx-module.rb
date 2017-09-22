class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.20.1.tar.gz"
  sha256 "d5ed2de127a614e784bd743e79cb1c5ba9b9bbfe2dfb433d4f01daff5f92947a"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

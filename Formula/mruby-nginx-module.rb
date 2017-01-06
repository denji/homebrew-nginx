class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.18.8.tar.gz"
  sha256 "2b0036b70966f6c3fb3d0cc31cb7c2ac46d03cf74fed7f0029de9614993df0aa"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

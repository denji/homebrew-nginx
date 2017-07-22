class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.20.0.tar.gz"
  sha256 "9b2642522c364f3439f004c62b8165638cf57d328d2652b4341e07d426928f75"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

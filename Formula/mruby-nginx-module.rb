class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.19.0.tar.gz"
  sha256 "1a1b00219d453c3771a78c933fa3e1bc03268903ac72adce792614329414016f"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.17.1.tar.gz"
  sha256 "5a347a5db0f12fc765640b30019c2355d9b26b5cbe0407c834983907ea65ceb7"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    (share+"mruby-nginx-module").install Dir["*"]
  end
end

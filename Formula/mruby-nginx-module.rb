class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.19.5.tar.gz"
  sha256 "efa11a613756179e0bbac560854ab9f4326f9072097b08dfefaed5d71c98ba09"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

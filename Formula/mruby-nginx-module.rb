class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumotory/ngx_mruby"
  url "https://github.com/matsumotory/ngx_mruby/archive/v2.2.4.tar.gz"
  sha256 "884f67430b00289a3b482fc8e64efffe18d09b97c9ff84ff483e5087dfc776c0"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

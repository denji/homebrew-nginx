class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumotory/ngx_mruby"
  url "https://github.com/matsumotory/ngx_mruby/archive/v2.2.3.tar.gz"
  sha256 "d4812fc0e3550ec672db65d71da73b4b0738323fc7edfb639d73ef34fb2e549e"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

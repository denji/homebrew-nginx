class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumotory/ngx_mruby"
  url "https://github.com/matsumotory/ngx_mruby/archive/v2.1.0.tar.gz"
  sha256 "8cc50f7bac46fab803d3ce18857dc3164fbfb733d728d75d0015a14756db0606"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

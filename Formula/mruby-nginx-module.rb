class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumotory/ngx_mruby"
  url "https://github.com/matsumotory/ngx_mruby/archive/v2.2.5.tar.gz"
  sha256 "257c3e0b4c75c0fd171cf71c70a0d9c52b55391e30005ba8b562d7df4d8e0cc8"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

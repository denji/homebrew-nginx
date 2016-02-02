class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.16.0.tar.gz"
  sha256 "2f13dbc8f8eec3176475a7689d4161aea03cec77efd289fb1cbce3b79576f66e"

  bottle :unneeded

  depends_on "git" => :build

  def install
    (share+"mruby-nginx-module").install Dir["*"]
  end
end

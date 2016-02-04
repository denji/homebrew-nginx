class MrubyNginxModule < Formula
  desc "Embed the power of MRuby into Nginx"
  homepage "https://github.com/matsumoto-r/ngx_mruby"
  url "https://github.com/matsumoto-r/ngx_mruby/archive/v1.16.1.tar.gz"
  sha256 "99cdf5c514bf009e22aea9fa0511a71067f4a31ea6c37c3766e00936539801de"

  bottle :unneeded

  def install
    (share+"mruby-nginx-module").install Dir["*"]
  end
end

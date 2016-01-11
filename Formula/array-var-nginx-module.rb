class ArrayVarNginxModule < Formula
  desc "Support for arrays to nginx config files"
  homepage "https://github.com/openresty/array-var-nginx-module"
  url "https://github.com/openresty/array-var-nginx-module/archive/v0.04.tar.gz"
  sha256 "1679eabdbca6df5719ae7dab3e0c0f5eff95044b8ec66ac8bff3b0dbe2fad382"

  bottle :unneeded

  depends_on "ngx-devel-kit"

  def install
    (share+"array-var-nginx-module").install Dir["*"]
  end
end

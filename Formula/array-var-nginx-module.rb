class ArrayVarNginxModule < Formula
  desc "Support for arrays to nginx config files"
  homepage "https://github.com/openresty/array-var-nginx-module"
  url "https://github.com/openresty/array-var-nginx-module/archive/v0.05.tar.gz"
  sha256 "c949d4be6f3442c8e2937046448dc8d8def25c0e0fa6f4e805144cea45eabe80"

  depends_on "ngx-devel-kit"

  def install
    pkgshare.install Dir["*"]
  end
end

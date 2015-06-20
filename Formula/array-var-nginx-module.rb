class ArrayVarNginxModule < Formula
  desc "Support for array variables to nginx config files"
  homepage "https://github.com/openresty/array-var-nginx-module"
  url "https://github.com/openresty/array-var-nginx-module/archive/v0.03.tar.gz"
  sha256 "f9892ec9a2e872d8aabeb2234d0d4c66cf85b8dbb2ca5c108a20c3d8c2111189"

  depends_on "ngx-devel-kit"

  def install
    (share+"array-var-nginx-module").install Dir["*"]
  end
end

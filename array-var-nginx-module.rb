require 'formula'

class ArrayVarNginxModule < Formula
  homepage 'https://github.com/openresty/array-var-nginx-module'
  url 'https://github.com/openresty/array-var-nginx-module/archive/v0.03.tar.gz'
  sha1 'b2666aa3c092060fcd3931a6d45798a5745c1ad6'

  depends_on 'ngx-devel-kit'

  def install
    (share+'array-var-nginx-module').install Dir['*']
  end
end

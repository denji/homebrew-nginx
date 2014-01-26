require 'formula'

class VarReqSpeedNginxModule < Formula
  homepage 'https://github.com/alexstup/ngx_http_var_request_speed'
  url 'https://github.com/alexstup/ngx_http_var_request_speed/archive/ad1abbc81b.tar.gz'
  sha1 'f2ce2dd4068b9abbfb16363bd0892768c92be02d'
  version '0.1'

  def install
    (share+'var-req-speed-nginx-module').install Dir['*']
  end
end

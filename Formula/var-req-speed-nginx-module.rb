require "formula"

class VarReqSpeedNginxModule < Formula
  homepage "https://github.com/nginx-modules/ngx_http_var_request_speed"
  url "https://github.com/nginx-modules/ngx_http_var_request_speed/archive/v1.0.tar.gz"
  sha1 "2883fe2b7beaee5ff5f99ef4e9f418b9ef177c9c"
  version "0.1"

  def install
    (share+"var-req-speed-nginx-module").install Dir["*"]
  end
end

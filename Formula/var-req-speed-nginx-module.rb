class VarReqSpeedNginxModule < Formula
  desc "Record time of request to $request_speed variable"
  homepage "https://github.com/nginx-modules/ngx_http_var_request_speed"
  url "https://github.com/nginx-modules/ngx_http_var_request_speed/archive/v1.0.tar.gz"
  version "0.1"
  sha256 "3473de7c25ecf22e586a59c0e1c078c4546aa1c8a6341d7b4daa628f8abe9839"

  def install
    pkgshare.install Dir["*"]
  end
end

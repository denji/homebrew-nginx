class AjpNginxModule < Formula
  homepage "https://github.com/yaoweibin/nginx_ajp_module"
  url "https://github.com/yaoweibin/nginx_ajp_module/archive/v0.3.0.tar.gz"
  sha1 "f6cdd105682c5f60144a19433bab84219952922c"
  version "0.3.0"

  def install
    (share+"ajp-nginx-module").install Dir["*"]
  end
end

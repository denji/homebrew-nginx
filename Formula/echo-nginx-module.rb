class EchoNginxModule < Formula
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.54.tar.gz"
  sha1 "35c1547c8366ec1c53ea33f95058b187674c7f2b"

  def install
    (share+"echo-nginx-module").install Dir["*"]
  end
end

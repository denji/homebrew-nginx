require "formula"
class RtmpNginxModule < Formula
  homepage "https://github.com/arut/nginx-rtmp-module"
  url "https://github.com/arut/nginx-rtmp-module/archive/v1.1.6.tar.gz"
  sha1 "1b91433367764efe2c1c7b5e781acdb05dbadc63"

  def install
    (share+"rtmp-nginx-module").install Dir["*"]
  end
end

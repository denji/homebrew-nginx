class Redis2NginxModule < Formula
  desc "upstream module for the Redis 2.0 protocol"
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.14.tar.gz"
  sha256 "d830e072fcb4acee8490ba3e38eee6034fd884a954d17ad4efeb397032c58a71"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

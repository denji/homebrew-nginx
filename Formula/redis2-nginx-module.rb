class Redis2NginxModule < Formula
  desc "upstream module for the Redis 2.0 protocol"
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.13.tar.gz"
  sha256 "1d2486e38cf10390961d507e0e1252e898c8cbc89bbef618f7439d6c23708523"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

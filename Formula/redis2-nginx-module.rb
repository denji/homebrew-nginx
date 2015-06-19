class Redis2NginxModule < Formula
  desc "upstream module for the Redis 2.0 protocol"
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.11.tar.gz"
  sha256 "877558e21304f413943e3bdf17b97659d8aed7e4bfdfd3ca964921a72de74c05"

  def install
    (share+"redis2-nginx-module").install Dir["*"]
  end
end

class Redis2NginxModule < Formula
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.10.tar.gz"
  sha1 "ce352ae84a2c03eee9a34880e7b5e4ffd19bdb01"

  def install
    (share+"redis2-nginx-module").install Dir["*"]
  end
end

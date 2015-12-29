class RedisNginxModule < Formula
  desc "keep-alive TCP connections to your backend redis servers"
  homepage "http://wiki.nginx.org/HttpRedis"
  url "https://people.FreeBSD.org/~osa/ngx_http_redis-0.3.7.tar.gz"
  sha256 "9dfc14db81f431fdf3d69f3661a37daf110aef5f9479aa7c88cf362bb5d62604"

  bottle :unneeded

  def install
    (share+"redis-nginx-module").install Dir["*"]
  end
end

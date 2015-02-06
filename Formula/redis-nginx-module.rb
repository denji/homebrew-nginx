class RedisNginxModule < Formula
  homepage "http://wiki.nginx.org/HttpRedis"
  url "http://people.FreeBSD.org/~osa/ngx_http_redis-0.3.7.tar.gz"
  sha1 "0d95a901118927da79d7a1adba0b9865cf57cc5f"

  def install
    (share+"redis-nginx-module").install Dir["*"]
  end
end

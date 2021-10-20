class RedisNginxModule < Formula
  desc "keep-alive TCP connections to your backend redis servers"
  homepage "http://wiki.nginx.org/HttpRedis"
  url "https://people.FreeBSD.org/~osa/ngx_http_redis-0.3.9.tar.gz"
  sha256 "21f87540f0a44b23ffa5df16fb3d788bc90803b255ef14f9c26e3847a6f26f46"

  def install
    pkgshare.install Dir["*"]
  end
end

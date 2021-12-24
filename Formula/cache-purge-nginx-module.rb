class CachePurgeNginxModule < Formula
  desc "Purge content from nginx - FastCGI, proxy, SCGI and uWSGI cache"
  homepage "https://github.com/nginx-modules/ngx_cache_purge"
  url "https://github.com/nginx-modules/ngx_cache_purge/archive/2.5.1.tar.gz"
  sha256 "9db968170c301168c4a623bce3fefe8bfd93d676c2006d1a8b2d5eec668cc22c"

  def install
    pkgshare.install Dir["*"]
  end
end

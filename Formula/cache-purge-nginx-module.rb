class CachePurgeNginxModule < Formula
  desc "Purge content from nginx - FastCGI, proxy, SCGI and uWSGI cache"
  homepage "https://github.com/nginx-modules/ngx_cache_purge"
  url "https://github.com/nginx-modules/ngx_cache_purge/archive/2.4.2.tar.gz"
  sha256 "067a10ae2a6d623deed5614d9fc55ec9b380d3b6060fd1e32e71c6f955d11cfc"

  def install
    pkgshare.install Dir["*"]
  end
end

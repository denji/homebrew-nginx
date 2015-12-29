class CachePurgeNginxModule < Formula
  desc "Purge content from nginx - FastCGI, proxy, SCGI and uWSGI cache"
  homepage "http://labs.frickle.com"
  url "http://labs.frickle.com/files/ngx_cache_purge-2.3.tar.gz"
  sha256 "279e0d8a46d3b1521fd43b3f78bc1c08b263899142a7cc5058c1c0361a92c89c"

  bottle :unneeded

  def install
    (share+"cache-purge-nginx-module").install Dir["*"]
  end
end

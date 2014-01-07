require 'formula'

class CachePurgeNginxModule < Formula
  homepage 'http://labs.frickle.com'
  url 'http://labs.frickle.com/files/ngx_cache_purge-2.1.tar.gz'
  sha1 'e6e3779487182c94efd3206751927ce722c1da5c'

  def install
    (share+'cache-purge-nginx-module').install Dir['*']
  end
end

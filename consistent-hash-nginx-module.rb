require 'formula'

class ConsistentHashNginxModule < Formula

  homepage 'https://github.com/replay/ngx_http_consistent_hash'
  url 'https://github.com/replay/ngx_http_consistent_hash/archive/master.tar.gz'
  sha1 '4aff332a839fe6e366d3b5faf21dd4dc81ff2459'
  version '0.0.1'

  def install
    (share+'consistent-hash-nginx-module').install Dir['*']
  end

end

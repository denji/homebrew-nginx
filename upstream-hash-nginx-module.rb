require 'formula'

class UpstreamHashNginxModule < Formula

  homepage 'https://github.com/evanmiller/nginx_upstream_hash'
  url 'https://github.com/evanmiller/nginx_upstream_hash/archive/master.tar.gz'
  sha1 '359c3e7f52266763301b29bdf07edfab3d7c32d9'
  version '0.0.1'

  def install
    (share+'upstream-hash-nginx-module').install Dir['*']
  end

end

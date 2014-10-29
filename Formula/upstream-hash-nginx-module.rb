require "formula"

class UpstreamHashNginxModule < Formula
  homepage "https://github.com/evanmiller/nginx_upstream_hash"
  url "https://github.com/evanmiller/nginx_upstream_hash/archive/master.tar.gz"
  sha1 "daf6650a36e197932670052cd9b8fe0db8230097"
  version "0.2"

  def install
    (share+"upstream-hash-nginx-module").install Dir["*"]
  end
end

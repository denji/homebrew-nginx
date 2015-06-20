class ConsistentHashNginxModule < Formula
  desc "Load Balancer which an consistent hash ring"
  homepage "https://github.com/replay/ngx_http_consistent_hash"
  url "https://github.com/replay/ngx_http_consistent_hash/archive/51c8dac.tar.gz"
  version "0.1"
  sha256 "2e959afe2c14a714377d3ec78d9a5a00c7f34f2a02bb7ab5473006826f6992eb"

  def install
    (share+"consistent-hash-nginx-module").install Dir["*"]
  end
end

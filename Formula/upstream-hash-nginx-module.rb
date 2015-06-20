class UpstreamHashNginxModule < Formula
  desc "hashing load-balancer for nginx"
  homepage "https://github.com/evanmiller/nginx_upstream_hash"
  url "https://github.com/evanmiller/nginx_upstream_hash/archive/859257d.tar.gz"
  version "0.2"
  sha256 "0b8a3a0270b47b1009974e94251930857d4bc59ed745ee2dac6312a58bf71ae5"

  def install
    (share+"upstream-hash-nginx-module").install Dir["*"]
  end
end

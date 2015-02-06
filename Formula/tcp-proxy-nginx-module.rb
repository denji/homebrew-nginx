class TcpProxyNginxModule < Formula
  homepage "https://github.com/yaoweibin/nginx_tcp_proxy_module"
  url "https://github.com/yaoweibin/nginx_tcp_proxy_module/archive/v0.4.5.tar.gz"
  sha1 "7060c16dba7f31a22462d1a1e3ac97d81c59aef2"

  def install
    (share+"tcp-proxy-nginx-module").install Dir["*"]
  end
end

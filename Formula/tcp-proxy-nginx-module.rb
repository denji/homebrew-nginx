class TcpProxyNginxModule < Formula
  desc "tcp proxy and health check and status monitor"
  homepage "https://github.com/yaoweibin/nginx_tcp_proxy_module"
  url "https://github.com/yaoweibin/nginx_tcp_proxy_module/archive/v0.4.5.tar.gz"
  sha256 "5225fa70785b14fcdf14a163d01b094c746b70e5ebad7dc35740af4f6d115390"

  def install
    pkgshare.install Dir["*"]
  end
end

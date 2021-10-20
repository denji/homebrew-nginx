class HealthcheckNginxModule < Formula
  desc "Health checks upstreams for nginx"
  homepage "https://github.com/cep21/healthcheck_nginx_upstreams"
  url "https://github.com/cep21/healthcheck_nginx_upstreams/archive/16d6ae7.tar.gz"
  version "0.1"
  sha256 "0d1c04b449e4ba383b21d3f718973508a50a77ad8e8003df15f8e9c592c2f540"

  def install
    pkgshare.install Dir["*"]
  end
end

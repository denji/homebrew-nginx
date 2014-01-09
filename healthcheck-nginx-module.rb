require 'formula'

class HealthcheckNginxModule < Formula

  homepage "https://github.com/cep21/healthcheck_nginx_upstreams"
  url "https://github.com/cep21/healthcheck_nginx_upstreams/archive/master.tar.gz"

  sha1 '4c539aa1bd29ea22406ce352142873d6efbe86c0'

  def install
    (share+'healthcheck-nginx-module').install Dir['*']
  end

end

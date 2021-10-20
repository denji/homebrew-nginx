class AccesskeyNginxModule < Formula
  desc "Denies access unless the request URL contains access key"
  homepage "http://wiki.nginx.org/NginxHttpAccessKeyModule"
  url "http://wiki.nginx.org/images/5/51/Nginx-accesskey-2.0.3.tar.gz"
  sha256 "d9e94321e78a02de16c57f3e048fd31059fd8116ed03d6de7180f435c52502b1"

  def install
    pkgshare.install Dir["*"]
  end
end

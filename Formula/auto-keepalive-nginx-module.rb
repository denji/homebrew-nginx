class AutoKeepaliveNginxModule < Formula
  desc "auto disable keepalive in some situations"
  homepage "https://github.com/ideal/ngx_http_auto_keepalive"
  url "https://github.com/ideal/ngx_http_auto_keepalive/archive/86369fc5f4.tar.gz"
  sha256 "131b2af8a6d36a523058292881171343aa4f82ba1f4ebd29794651e8d5d736e5"

  def install
    pkgshare.install Dir["*"]
  end
end

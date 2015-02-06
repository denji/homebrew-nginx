class AutoKeepaliveNginxModule < Formula
  homepage "https://github.com/ideal/ngx_http_auto_keepalive"
  url "https://github.com/ideal/ngx_http_auto_keepalive/archive/86369fc5f4.tar.gz"
  sha1 "11851b879f6643280525c024836e8d875d1dec33"

  def install
    (share+"auto-keepalive-nginx-module").install Dir["*"]
  end
end

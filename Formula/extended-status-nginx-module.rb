class ExtendedStatusNginxModule < Formula
  homepage "https://github.com/nginx-modules/ngx_http_extended_status_module"
  url "https://github.com/nginx-modules/ngx_http_extended_status_module/archive/1.2a.tar.gz"
  sha1 "bcaab37d1df63aff38b1d424443a47244ad8d409"

  def install
    (share+"extended-status-nginx-module").install Dir["*"]
  end
end

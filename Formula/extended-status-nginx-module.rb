class ExtendedStatusNginxModule < Formula
  homepage "https://github.com/nginx-modules/ngx_http_extended_status_module"
  url "https://github.com/nginx-modules/ngx_http_extended_status_module/archive/1.1.tar.gz"
  sha1 "8a36363cedb6fbf16846d4d4639eecb1eade6bb9"

  def install
    (share+"extended-status-nginx-module").install Dir["*"]
  end
end

class ExtendedStatusNginxModule < Formula
  desc "Additional status information"
  homepage "https://github.com/nginx-modules/ngx_http_extended_status_module"
  url "https://github.com/nginx-modules/ngx_http_extended_status_module/archive/1.1.tar.gz"
  sha256 "054b4c1ecae202991d9bfa4efb8c112a883c0d46a6017a5179dc4243a86f7451"

  def install
    pkgshare.install Dir["*"]
  end
end

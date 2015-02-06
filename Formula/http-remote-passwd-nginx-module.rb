class HttpRemotePasswdNginxModule < Formula
  homepage "https://github.com/x-way/ngx_http_remote_passwd"
  url "https://github.com/x-way/ngx_http_remote_passwd/archive/8f5ccc2b70.tar.gz"
  sha1 "1006b236a932d6659fba55d322f7d00dfb2431b0"

  def install
    (share+"http-remote-passwd-nginx-module").install Dir["*"]
  end
end

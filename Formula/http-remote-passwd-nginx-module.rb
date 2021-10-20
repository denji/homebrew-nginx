class HttpRemotePasswdNginxModule < Formula
  desc "Basic Auth available as variable $remote_passwd"
  homepage "https://github.com/x-way/ngx_http_remote_passwd"
  url "https://github.com/x-way/ngx_http_remote_passwd/archive/8f5ccc2b70.tar.gz"
  sha256 "2fb62875d915f87748ebc1308c2c2deee438fc83ba8ca4cd5226bb1d96470240"

  def install
    pkgshare.install Dir["*"]
  end
end

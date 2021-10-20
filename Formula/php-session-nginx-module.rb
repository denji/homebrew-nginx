class PhpSessionNginxModule < Formula
  desc "parse php sessions for nginx"
  homepage "https://github.com/replay/ngx_http_php_session"
  url "https://github.com/replay/ngx_http_php_session/archive/30f69b3bbe.tar.gz"
  version "0.4b"
  sha256 "8b2a6d77571657f60bd4a4e411604ddbe9cbe7cdd33f5537923dfe4254770694"

  def install
    pkgshare.install Dir["*"]
  end
end

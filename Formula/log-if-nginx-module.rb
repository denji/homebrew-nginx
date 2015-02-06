class LogIfNginxModule < Formula
  homepage "https://github.com/cfsego/ngx_log_if"
  url "https://github.com/cfsego/ngx_log_if/archive/master.tar.gz"
  sha1 "a337ae59efa7ef1d8a544706e73cb4b004774c56"
  version "0.1"

  def install
    (share+"log-if-nginx-module").install Dir["*"]
  end
end

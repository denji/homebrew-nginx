class LogIfNginxModule < Formula
  desc "allows you to control when not to write down access log"
  homepage "https://github.com/cfsego/ngx_log_if"
  url "https://github.com/cfsego/ngx_log_if/archive/32ff3e9.tar.gz"
  version "0.1"
  sha256 "1d10d5265f619f9e012b91a69381f5b057896c6b5a445e18b9857f65b8f2b8a9"
  head "https://github.com/cfsego/ngx_log_if.git"

  def install
    pkgshare.install Dir["*"]
  end
end

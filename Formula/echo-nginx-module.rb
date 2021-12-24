class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.62.tar.gz"
  sha256 "86f6866baf7297d85feb42ff6d9c212d1de696f3314a53d3a41a4b533a67ab01"
  head "https://github.com/openresty/echo-nginx-module.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

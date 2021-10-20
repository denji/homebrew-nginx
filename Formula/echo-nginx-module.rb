class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.61.tar.gz"
  sha256 "2e6a03032555f5da1bdff2ae96c96486f447da3da37c117e0f964ae0753d22aa"
  head "https://github.com/openresty/echo-nginx-module.git"

  def install
    pkgshare.install Dir["*"]
  end
end

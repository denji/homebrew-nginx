class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.60.tar.gz"
  sha256 "1077da2229ac7d0a0215e9e6817e297c10697e095010d88f1adbd1add1ce9f4e"
  head "https://github.com/openresty/echo-nginx-module.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

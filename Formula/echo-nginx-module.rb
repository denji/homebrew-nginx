class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.58.tar.gz"
  sha256 "190fe3977dd1910e82059f30f9baae3da2ee6e6fb50f18c9bc2605a19dbb9626"
  head "https://github.com/openresty/echo-nginx-module.git"

  bottle :unneeded

  def install
    (share+"echo-nginx-module").install Dir["*"]
  end
end

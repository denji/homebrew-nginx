class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.57.tar.gz"
  sha256 "8467237ca0fae74ca7a32fbd34fc6044df307098415d48068214c9c235695a07"
  head "https://github.com/openresty/echo-nginx-module.git"

  def install
    (share+"echo-nginx-module").install Dir["*"]
  end
end

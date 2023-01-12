class EchoNginxModule < Formula
  desc "Brings echo/sleep/time/exec and more shell-style"
  homepage "https://github.com/openresty/echo-nginx-module"
  url "https://github.com/openresty/echo-nginx-module/archive/v0.63.tar.gz"
  sha256 "8af374d29592ef95baee53c91959c7b04927f11304c318a94f0ee140760515a4"
  head "https://github.com/openresty/echo-nginx-module.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

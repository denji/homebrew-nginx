class AntiDdosNginxModule < Formula
  desc "Anti-DDOS module for nginx webserver"
  homepage "https://github.com/aufi/anddos"
  url "https://github.com/aufi/anddos/archive/0507b433bb.tar.gz"
  version "0.1"
  sha256 "eba0b685f500b963c41155330a7c7f42097a36f8d7a2017c467c5c9ee863a732"

  def install
    pkgshare.install Dir["anddos/*"]
  end
end

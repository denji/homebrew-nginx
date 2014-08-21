require "formula"

class AntiDdosNginxModule < Formula
  homepage "https://github.com/aufi/anddos"
  url "https://github.com/aufi/anddos/archive/0507b433bb.tar.gz"
  sha1 "758859a055538cf8d183bc8a9c72f643bd49312a"
  version "0.1"

  def install
    (share+"anti-ddos-nginx-module").mv "anddos/*", "./"
    (share+"anti-ddos-nginx-module").rm_rf "anddos"
    (share+"anti-ddos-nginx-module").install Dir["*"]
  end
end

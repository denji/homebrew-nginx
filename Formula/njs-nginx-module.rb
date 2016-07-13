class NjsNginxModule < Formula
  desc "Nginx NJS module"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/master/nginx-njs-c4a5f2b.tar.gz"
  version "1.10.0.0.0.20160414.1c50334fbea6-1"
  sha256 "6c348eec7991361698c4c7c1830388a679c5516bf8a6a25d2d07a3c23642f545"

  bottle :unneeded

  # The njs folder is organized is this way:
  #
  # njs/nginx/: contains the config
  # njs/njs/: javascript vm
  # njs/nxt/: nginx - vm stubs
  #
  # it is not possible to install from "nginx/*" since
  # the other folders would not be copied, and the files in the
  # nginx folder have a reference to the ../nxt and ../njs folders

  def install
    (share+"njs-nginx-module").install Dir["*"]
  end
end

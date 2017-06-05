class NjsNginxModule < Formula
  desc "Nginx NJS module"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.1.10.tar.gz"
  sha256 "c41155224b944faa468c742d501c1e9287399b0fe92837556facd311591b2e95"

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

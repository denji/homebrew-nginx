class DosdetectorNginxModule < Formula
  desc "Detecting Dos attacks for nginx"
  homepage "https://github.com/cubicdaiya/ngx_dosdetector"
  url "https://github.com/cubicdaiya/ngx_dosdetector/archive/91a40e87c1.tar.gz"
  version "0.1"
  sha256 "eafac404719c21143e645d24540735f18446f61a8d0dd605b4116f1064741172"

  def install
    pkgshare.install Dir["*"]
  end
end

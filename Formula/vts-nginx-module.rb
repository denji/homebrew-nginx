class VtsNginxModule < Formula
  desc "Nginx virtual host traffic status module"
  homepage "https://github.com/vozlt/nginx-module-vts"
  url "https://github.com/vozlt/nginx-module-vts/archive/v0.1.18.tar.gz"
  sha256 "17ea41d4083f6d1ab1ab83dad9160eeca66867abe16c5a0421f85a39d7c84b65"
  head "https://github.com/vozlt/nginx-module-vts.git"

  def install
    pkgshare.install Dir["*"]
  end
end

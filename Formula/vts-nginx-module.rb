class VtsNginxModule < Formula
  desc "Nginx virtual host traffic status module"
  homepage "https://github.com/vozlt/nginx-module-vts"
  url "https://github.com/vozlt/nginx-module-vts/archive/v0.2.1.tar.gz"
  sha256 "1a63d78d3ae4df18b3a57a616eeee006cdc0bd71aa7ea2947046004b123704f4"
  head "https://github.com/vozlt/nginx-module-vts.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

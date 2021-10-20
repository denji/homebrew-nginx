class AjpNginxModule < Formula
  desc "Support AJP protocol proxy with Nginx"
  homepage "https://github.com/yaoweibin/nginx_ajp_module"
  url "https://github.com/yaoweibin/nginx_ajp_module/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "7b3791275ef87dde153679fa459e84784da09b26d35426d61f5477903584b254"

  def install
    pkgshare.install Dir["*"]
  end
end

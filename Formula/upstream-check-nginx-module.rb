class UpstreamCheckNginxModule < Formula
  desc "upstream health check for nginx"
  homepage "https://github.com/yaoweibin/nginx_upstream_check_module"
  url "https://github.com/yaoweibin/nginx_upstream_check_module/archive/refs/tags/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "41059b5a703ccc45cd404b345e5a77c6d6bc92f6b5d41865a9a6ce92291cd57b"

  def install
    pkgshare.install Dir["*"]
  end
end

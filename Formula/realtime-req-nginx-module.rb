class RealtimeReqNginxModule < Formula
  desc "Adds ability to count tranffic from vhost"
  homepage "https://github.com/magicbear/ngx_realtime_request_module"
  url "https://github.com/magicbear/ngx_realtime_request_module/archive/1c89cd3da8.tar.gz"
  sha256 "45bf467e8600487e3c88640f37a7f1cb4a629a39fe8461490607fa52a9ff8e7b"

  def install
    pkgshare.install Dir["*"]
  end
end

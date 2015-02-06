class RealtimeReqNginxModule < Formula
  homepage "https://github.com/magicbear/ngx_realtime_request_module"
  url "https://github.com/magicbear/ngx_realtime_request_module/archive/1c89cd3da8.tar.gz"
  sha1 "a4b9723585064b33c2157358406c3deb70edce6d"

  def install
    (share+"realtime-req-nginx-module").install Dir["*"]
  end
end

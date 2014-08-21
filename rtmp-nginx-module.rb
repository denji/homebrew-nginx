require "formula"
class RtmpNginxModule < Formula
  homepage "https://github.com/arut/nginx-rtmp-module"
  url "https://github.com/arut/nginx-rtmp-module/archive/812e2fd7b1888c3142e34cc0e687401fa088e93d.tar.gz"
  sha1 "fc7c9909bc1f4870d136378309b4021838f2a14c"
  version "1.1.4b"

  def install
    (share+"rtmp-nginx-module").install Dir["*"]
  end
end

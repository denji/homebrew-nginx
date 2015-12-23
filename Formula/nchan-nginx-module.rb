class NchanNginxModule < Formula
  desc "flexible, fast pub/sub server with Websocket, EventSource, LongPoll support & more."
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.931.tar.gz"
  sha256 "f60171982db9cddc9f07c441cfe41313e0776ebb8d9ea64fd88d00d34a7e4042"

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
end

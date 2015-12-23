class NchanNginxModule < Formula
  desc "flexible, fast pub/sub server with Websocket, EventSource, LongPoll support & more."
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.94.tar.gz"
  sha256 "e4006c5f48399a753b1fc9de061d80b1a339198a8be2c8c460e8a4af40f7c2fc"

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
end

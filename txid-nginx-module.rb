require "formula"

class TxidNginxModule < Formula
  homepage "https://github.com/streadway/ngx_txid"
  url "https://github.com/streadway/ngx_txid/archive/e7df6b153f.tar.gz"
  sha1 "8e779f757ddc5e62237c45b925aba20b8e131e99"
  version "0.1"

  def install
    (share+"txid-nginx-module").install Dir["*"]
  end
end

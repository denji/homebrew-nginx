class TxidNginxModule < Formula
  desc "sortable unique id in 20 case-insensitive characters"
  homepage "https://github.com/streadway/ngx_txid"
  url "https://github.com/streadway/ngx_txid/archive/f1c197c.tar.gz"
  version "0.2"
  sha256 "c5c14172cf23e572d2258bbbbdf09ae7a81a7b6503ce1a0efe0f76260a9a86c5"

  def install
    pkgshare.install Dir["*"]
  end
end

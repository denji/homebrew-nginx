class UpstreamOrderNginxModule < Formula
  desc "Attempt to access backends according the order"
  homepage "https://github.com/flygoast/ngx_http_upstream_order"
  url "https://github.com/flygoast/ngx_http_upstream_order/archive/d820667a5f.tar.gz"
  version "0.1"
  sha256 "e5fa35bd3ae20b94b760f396bae1aa56a233db79e881472786503f4a7370db27"

  def install
    pkgshare.install Dir["*"]
  end
end

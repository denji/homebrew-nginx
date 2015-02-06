class UpstreamOrderNginxModule < Formula
  homepage "https://github.com/flygoast/ngx_http_upstream_order"
  url "https://github.com/flygoast/ngx_http_upstream_order/archive/d820667a5f.tar.gz"
  sha1 "b98a582d63f26da48dd3fe586c6e54863adc102e"
  version "0.1"

  def install
    (share+"upstream-order-nginx-module").install Dir["*"]
  end
end

require "formula"

class UstatsNginxModule < Formula
  homepage "https://github.com/nginx-modules/ngx_ustats_module"
  url "https://github.com/nginx-modules/ngx_ustats_module/archive/ngx_ustats_0.3.tar.gz"
  sha1 "b1d574ed613c15ccc9795513aacd22e896b15759"
  version "0.3"

  def install
    (share+"ustats-nginx-module").install Dir["*"]
  end
end

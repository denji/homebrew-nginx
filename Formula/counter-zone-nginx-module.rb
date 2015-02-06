class CounterZoneNginxModule < Formula
  homepage "https://github.com/theromis/ngx_counter_zone"
  url "https://github.com/theromis/ngx_counter_zone/archive/dd78fcb781.tar.gz"
  sha1 "ed97ea0503eefb0aa0e2c3ac3924fb9b606d2eb5"

  def install
    (share+"counter-zone-nginx-module").install Dir["*"]
  end
end

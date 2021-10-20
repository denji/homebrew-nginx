class CounterZoneNginxModule < Formula
  desc "Gives realtime counters using NGINX config"
  homepage "https://github.com/theromis/ngx_counter_zone"
  url "https://github.com/theromis/ngx_counter_zone/archive/4be9e36.tar.gz"
  sha256 "9b841ed09ec39cbe27dab16e017433418c0546fba58bc48d853bed0dcae9e322"

  def install
    pkgshare.install Dir["*"]
  end
end

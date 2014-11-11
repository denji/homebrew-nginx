require "formula"

class SubsFilterNginxModule < Formula
  homepage "https://github.com/yaoweibin/ngx_http_substitutions_filter_module"
  url "https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/v0.6.4.tar.gz"
  sha1 "4b586a95411216fe64811758f05975ccf450a490"
  version "0.6.4"

  def install
    (share+"subs-filter-nginx-module").install Dir["*"]
  end
end

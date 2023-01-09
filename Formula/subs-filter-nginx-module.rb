class SubsFilterNginxModule < Formula
  desc "Regular expression and fixed string substitutions"
  homepage "https://github.com/yaoweibin/ngx_http_substitutions_filter_module"
  url "https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/e12e965.tar.gz"
  version "0.6.4-p1"
  sha256 "da2a26aa75884e1216941c7291b6e8b7fc4dd7163700a04191b92060b61fabb3"

  def install
    pkgshare.install Dir["*"]
  end
end

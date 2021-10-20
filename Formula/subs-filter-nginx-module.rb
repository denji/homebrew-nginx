class SubsFilterNginxModule < Formula
  desc "regular expression and fixed string substitutions"
  homepage "https://github.com/yaoweibin/ngx_http_substitutions_filter_module"
  url "https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/v0.6.4.tar.gz"
  version "0.6.4"
  sha256 "ed4ddbcf0c434f4a1e97b61251a63ace759792764bd5cb79ff20efe348db8db3"

  def install
    pkgshare.install Dir["*"]
  end
end

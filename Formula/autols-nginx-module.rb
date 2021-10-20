class AutolsNginxModule < Formula
  desc "Flexible nginx auto index module"
  homepage "https://github.com/DvdKhl/ngx_http_autols_module"
  url "https://github.com/DvdKhl/ngx_http_autols_module/archive/e0da4b2ff3.tar.gz"
  sha256 "445c5f3ce494f253afe09de7f418fb076ac9aa5c76083a4186e863156fa9d9fc"

  def install
    pkgshare.install Dir["ngx_http_autols_module/*"]
  end
end

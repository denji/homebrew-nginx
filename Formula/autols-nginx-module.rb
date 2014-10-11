require "formula"

class AutolsNginxModule < Formula
  homepage "https://github.com/DvdKhl/ngx_http_autols_module"
  url "https://github.com/DvdKhl/ngx_http_autols_module/archive/e0da4b2ff3.tar.gz"
  sha1 "b37901b2418f688ffb84f909d2fa8e165fcb258d"

  def install
    (share+"autols-nginx-module").install Dir["ngx_http_autols_module/*"]
  end
end

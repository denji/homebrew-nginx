class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"
  url "https://github.com/google/ngx_brotli/archive/refs/tags/v1.0.0rc.tar.gz"
  sha256 "c85cdcfd76703c95aa4204ee4c2e619aa5b075cac18f428202f65552104add3b"
  head "https://github.com/google/ngx_brotli.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

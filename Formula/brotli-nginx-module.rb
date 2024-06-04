class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/google/ngx_brotli"
  url "https://github.com/google/ngx_brotli.git",
      revision: "a71f9312c2deb28875acc7bacfdd5695a111aa53"
  version "1.1.0rc"
  head "https://github.com/google/ngx_brotli.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

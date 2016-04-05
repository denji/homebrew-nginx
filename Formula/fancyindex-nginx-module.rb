class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.3.6.tar.gz"
  sha256 "e73f1f0444f8c53601b51da8684b174c5ffd3b4ed6eb7956dd57f8b95485b68f"
  head "https://github.com/aperezdc/ngx-fancyindex.git"

  bottle :unneeded

  def install
    (share+"fancyindex-nginx-module").install Dir["*"]
  end
end

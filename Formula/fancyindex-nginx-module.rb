class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.4.3.tar.gz"
  sha256 "81698fb0c1ec9f906ce308c055d5d248085caf390f4b92516c1ec93f87c886d4"
  head "https://github.com/aperezdc/ngx-fancyindex.git"

  def install
    pkgshare.install Dir["*"]
  end
end

class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.4.2.tar.gz"
  sha256 "8327150864ca267b735d550d3304030efbbd863fdddfe0a94e970f249a8827ee"
  head "https://github.com/aperezdc/ngx-fancyindex.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

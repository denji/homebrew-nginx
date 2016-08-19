class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.4.1.tar.gz"
  sha256 "2b00d8e0ad2a67152a9cee7b7ee67990c742d501412df912baaf1eee9bb6dc71"
  head "https://github.com/aperezdc/ngx-fancyindex.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

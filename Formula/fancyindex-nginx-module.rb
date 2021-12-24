class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.5.2.tar.gz"
  sha256 "c3dd84d8ba0b8daeace3041ef5987e3fb96e9c7c17df30c9ffe2fe3aa2a0ca31"
  head "https://github.com/aperezdc/ngx-fancyindex.git", branch: "master"

  def install
    pkgshare.install Dir["*"]
  end
end

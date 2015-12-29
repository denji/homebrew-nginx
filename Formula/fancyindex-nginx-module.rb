class FancyindexNginxModule < Formula
  desc "Fancy indexes module for the Nginx"
  homepage "https://github.com/aperezdc/ngx-fancyindex"
  url "https://github.com/aperezdc/ngx-fancyindex/archive/v0.3.5.tar.gz"
  sha256 "e0998e83be58bc5787fa9243a76a9d21de3cd01088d3cf63177ba88a562634a1"
  head "https://github.com/aperezdc/ngx-fancyindex.git"

  bottle :unneeded

  def install
    (share+"fancyindex-nginx-module").install Dir["*"]
  end
end

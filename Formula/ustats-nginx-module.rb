class UstatsNginxModule < Formula
  desc "basic statistics for each backend in nginx upstreams"
  homepage "https://github.com/nginx-modules/ngx_ustats_module"
  url "https://github.com/nginx-modules/ngx_ustats_module/archive/ngx_ustats_0.3.tar.gz"
  version "0.3"
  sha256 "4eb5aadd2129da80d110d6c5a9f6a13485c0a24b5397d183bd24fcbe03125771"

  def install
    pkgshare.install Dir["*"]
  end
end

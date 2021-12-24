class XsltprocNginxModule < Formula
  desc "XSLT processor bases on Nginx"
  homepage "https://github.com/yoreek/nginx-xsltproc-module"
  url "https://github.com/yoreek/nginx-xsltproc-module/archive/v0.17.tar.gz"
  sha256 "cb9157957dffb28c6d15da437396d146b09304901d9d56fa180b9925b039f5eb"

  def install
    pkgshare.install Dir["*"]
  end
end

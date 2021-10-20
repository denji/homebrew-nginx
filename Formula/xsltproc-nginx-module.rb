class XsltprocNginxModule < Formula
  desc "XSLT processor bases on Nginx"
  homepage "https://github.com/yoreek/nginx-xsltproc-module"
  url "https://github.com/yoreek/nginx-xsltproc-module/archive/v0.16.tar.gz"
  sha256 "9003d5aa7bff157577d1f8fb5ee070ee52544fc53c48bb9aa0bdd092e5f39bcf"

  def install
    pkgshare.install Dir["*"]
  end
end

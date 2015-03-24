class XsltprocNginxModule < Formula
  homepage "https://github.com/yoreek/nginx-xsltproc-module"
  url "https://github.com/yoreek/nginx-xsltproc-module/archive/v0.16.tar.gz"
  sha1 "9e97863236771d54f9d4045e93935157d487091b"

  def install
    (share+"xsltproc-nginx-module").install Dir["*"]
  end
end

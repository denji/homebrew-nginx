class DavExtNginxModule < Formula
  desc "WebDAV missing commands support PROPFIND and OPTIONS"
  homepage "https://github.com/arut/nginx-dav-ext-module"
  url "https://github.com/arut/nginx-dav-ext-module/archive/v3.0.0.tar.gz"
  sha256 "d2499d94d82d4e4eac8425d799e52883131ae86a956524040ff2fd230ef9f859"

  def install
    pkgshare.install Dir["*"]
  end
end

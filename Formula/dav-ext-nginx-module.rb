class DavExtNginxModule < Formula
  desc "WebDAV missing commands support PROPFIND and OPTIONS"
  homepage "https://github.com/arut/nginx-dav-ext-module"
  url "https://github.com/arut/nginx-dav-ext-module/archive/v0.0.3.tar.gz"
  version "0.0.3"
  sha256 "d428a0236c933779cb40ac8c91afb19d5c25a376dc3caab825bfd543e1ee530d"

  bottle :unneeded

  def install
    (share+"dav-ext-nginx-module").install Dir["*"]
  end
end

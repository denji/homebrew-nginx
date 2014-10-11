require "formula"

class DavExtNginxModule < Formula
  # NGINX WebDAV missing commands support (PROPFIND & OPTIONS)
  homepage "https://github.com/arut/nginx-dav-ext-module"
  url "https://github.com/arut/nginx-dav-ext-module/archive/v0.0.3.tar.gz"
  sha1 "80714f9471cb5c8259ecdca9e25eb32f4d581074"
  version "0.0.3"

  def install
    unless build.include? "with-webdav"
      onoe <<-EOS.undent
       Error: WebDav Extended Module not work without webdav support in nginx.
       Please use "--with-webdav" with nginx-full.
      EOS
      exit -1
    end
    (share+"dav-ext-nginx-module").install Dir["*"]
  end
end

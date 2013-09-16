require 'formula'

class DavExtNginxModule < Formula
  # NGINX WebDAV missing commands support (PROPFIND & OPTIONS)
  homepage 'https://github.com/arut/nginx-dav-ext-module'
  url 'https://github.com/arut/nginx-dav-ext-module/archive/master.tar.gz'
  sha1 '329a06c74194bfe8b5f42126cb752293ccd8e98e'
  version '0.0.3'

  if build.without? 'with-webdav'
    onoe <<-EOS.undent
     Error: WebDav Extended Module not work without webdav support in nginx.
     Please use '--with-webdav' with nginx-full.
    EOS
    exit -1
  end

  def install
    (share+'dav-ext-nginx-module').install Dir['*']
  end

end

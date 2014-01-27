require 'formula'

class ModZipNginxModule < Formula
  homepage 'https://github.com/evanmiller/mod_zip'
  url 'https://github.com/evanmiller/mod_zip/archive/35ea7ff.tar.gz'
  sha1 'f9a085915e471e2aeb97e06db3f1d6d72a779fab'
  version '0.1'

  def install
    (share+'mod-zip-nginx-module').install Dir['*']
  end
end

require 'formula'

class UploadNginxModule < Formula
  homepage 'http://wiki.nginx.org/HttpUploadModule'
  url 'https://github.com/vkholodkov/nginx-upload-module/archive/2.2.tar.gz'
  sha1 'a7d31ac0358b86ff12a07bcda1e9a8714118c2bb'
  version '2.2.0'

  def install
    (share+'upload-nginx-module').install Dir['*']
  end
end

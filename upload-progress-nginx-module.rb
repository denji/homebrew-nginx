require 'formula'

class UploadProgressNginxModule < Formula
  homepage 'http://wiki.nginx.org/HttpUploadProgressModule'
  url 'http://github.com/downloads/masterzen/nginx-upload-progress-module/nginx_uploadprogress_module-0.9.0.tar.gz'
  sha1 '93aadaf6065e1e8afd9f14b9291a66819d3aa4c0'
  version '0.9.0'

  def install
    (share+'upload-progress-nginx-module').install Dir['*']
  end
end

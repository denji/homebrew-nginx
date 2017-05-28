require 'formula'

class UploadNginxModule < Formula

  homepage 'http://wiki.nginx.org/HttpUploadModule'
  url 'http://www.grid.net.ru/nginx/download/nginx_upload_module-2.2.0.tar.gz'
  sha1 '93d6e83e613a0ce2ed057a434b344fa1b6609b47'

  def install
    (share+'upload-nginx-module').install Dir['*']
  end

end

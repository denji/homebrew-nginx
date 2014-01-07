require 'formula'

class AuthPamNginxModule < Formula
  homepage 'http://web.iti.upv.es/~sto/nginx/'
  url 'http://web.iti.upv.es/~sto/nginx/ngx_http_auth_pam_module-1.2.tar.gz'
  sha1 '3bb82c75f7cbace4c10b11aa51adbe36ab0803ed'

  def install
    (share+'auth-pam-nginx-module').install Dir['*']
  end
end

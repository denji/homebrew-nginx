require 'formula'

class AuthDigestNginxModule < Formula
  homepage 'https://github.com/samizdatco/nginx-http-auth-digest'
  url 'https://github.com/samizdatco/nginx-http-auth-digest/archive/master.tar.gz'
  sha1 '3188e07820d5a06f8328f61875dbb91d4a74b6c0'
  version '0.0.1'

  def install
    (share+'auth-digest-nginx-module').install Dir['*']
  end
end

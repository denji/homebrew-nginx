require 'formula'

class AuthLdapNginxModule < Formula
  homepage 'https://github.com/kvspb/nginx-auth-ldap'
  url 'https://github.com/kvspb/nginx-auth-ldap/archive/master.tar.gz'
  sha1 'e52a6b131a58a0ded2c7ef162caa122209ffe568'
  version '0.1'

  depends_on "openldap"

  def install
    (share+'auth-ldap-nginx-module').install Dir['*']
  end
end

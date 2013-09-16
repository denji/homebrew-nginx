require 'formula'

class AuthLdapNginxModule < Formula

  homepage 'https://github.com/kvspb/nginx-auth-ldap'
  url 'https://github.com/kvspb/nginx-auth-ldap/archive/master.tar.gz'
  sha1 '663c521a487ff5b6c87c59b8fe5a7677410a30b0'
  version '0.0.1'

  def install
    (share+'auth-ldap-nginx-module').install Dir['*']
  end

end

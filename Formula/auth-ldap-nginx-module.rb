class AuthLdapNginxModule < Formula
  desc "LDAP authentication module for nginx"
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/d0f2f82.tar.gz"
  version "d0f2f82"
  sha256 "7c1628d7e6ebb3a41ec916334014b74acc32dd09a0830752a2d03be0be3223c8"
  head "https://github.com/kvspb/nginx-auth-ldap.git"

  bottle :unneeded

  depends_on "openldap"

  def install
    (share+"auth-ldap-nginx-module").install Dir["*"]
  end
end

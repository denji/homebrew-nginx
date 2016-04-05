class AuthLdapNginxModule < Formula
  desc "LDAP authentication module for nginx"
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/8517bb0.tar.gz"
  version "8517bb0"
  sha256 "2f0b1a65847ea1da801a99b654f132e1c814d2fa49a43a324d8fc4ce6327935f"
  head "https://github.com/kvspb/nginx-auth-ldap.git"

  bottle :unneeded

  depends_on "openldap"

  def install
    (share+"auth-ldap-nginx-module").install Dir["*"]
  end
end

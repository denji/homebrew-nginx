class AuthLdapNginxModule < Formula
  desc "LDAP authentication module for nginx"
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/42d195d.tar.gz"
  version "42d195d"
  sha256 "80d6cce9a9877d51dec2f85a11ce7cd25edbd2d605c28bc28687ecc5695229ee"
  head "https://github.com/kvspb/nginx-auth-ldap.git"

  depends_on "openldap"

  def install
    pkgshare.install Dir["*"]
  end
end

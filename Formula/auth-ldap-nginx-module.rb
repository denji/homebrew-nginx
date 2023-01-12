class AuthLdapNginxModule < Formula
  desc "LDAP authentication module for nginx"
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/83c059b.tar.gz"
  version "83c059b"
  sha256 "690c4e5bdb2ae19b0fee75cd356d18013468db472616b6097a5a0bbe346c8464"
  head "https://github.com/kvspb/nginx-auth-ldap.git", branch: "master"

  depends_on "openldap"

  def install
    pkgshare.install Dir["*"]
  end
end

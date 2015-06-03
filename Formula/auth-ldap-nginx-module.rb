class AuthLdapNginxModule < Formula
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  desc "LDAP authentication module for nginx"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/928856aa95a12dd62c6b0c0f4b6f04451e063be4.tar.gz"
  sha256 "e762a8e2686a2860cdfe54edb804bb9bac0bef6f7ef1c4c5d63854e661514b9f"
  version "928856a"
  head "https://github.com/kvspb/nginx-auth-ldap.git"

  depends_on "openldap"

  def install
    (share+"auth-ldap-nginx-module").install Dir["*"]
  end
end

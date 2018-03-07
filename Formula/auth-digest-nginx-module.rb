class AuthDigestNginxModule < Formula
  desc "Digest Authentication for Nginx"
  homepage "https://github.com/samizdatco/nginx-http-auth-digest"
  url "https://github.com/samizdatco/nginx-http-auth-digest/archive/274490c.tar.gz"
  version "0.2.1"
  sha256 "ede0ad490cb9dd69da348bdea2a60a4c45284c9777b2f13fa48394b6b8e7671c"
  revision 2

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

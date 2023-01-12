class AuthDigestNginxModule < Formula
  desc "Digest Authentication for Nginx"
  homepage "https://github.com/samizdatco/nginx-http-auth-digest"
  url "https://github.com/samizdatco/nginx-http-auth-digest/archive/823853c.tar.gz"
  version "823853c"
  sha256 "5bd3e208933ba973b550cca9fa280888802af3f82049cf8b2708c1bc21e3d6e7"

  def install
    pkgshare.install Dir["*"]
  end
end

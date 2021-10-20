class AuthDigestNginxModule < Formula
  desc "Digest Authentication for Nginx"
  homepage "https://github.com/samizdatco/nginx-http-auth-digest"
  url "https://github.com/samizdatco/nginx-http-auth-digest/archive/cd86418.tar.gz"
  version "0.2.2"
  sha256 "fe683831f832aae4737de1e1026a4454017c2d5f98cb88b08c5411dc380062f8"

  def install
    pkgshare.install Dir["*"]
  end
end

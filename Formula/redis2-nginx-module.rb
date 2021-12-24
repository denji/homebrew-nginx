class Redis2NginxModule < Formula
  desc "Upstream module for the Redis 2.0 protocol"
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.15.tar.gz"
  sha256 "d255571bcfb9939b78099df39cb4d42f174d789aec8c8e5e47b93942b0299438"

  def install
    pkgshare.install Dir["*"]
  end
end

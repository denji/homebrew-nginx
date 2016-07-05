class Redis2NginxModule < Formula
  desc "upstream module for the Redis 2.0 protocol"
  homepage "https://github.com/openresty/redis2-nginx-module"
  url "https://github.com/openresty/redis2-nginx-module/archive/v0.12.tar.gz"
  sha256 "baf5274c815a5f27854747df09ff5bcd6d82e0baa2f224a9db6450d2f3a35a4f"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

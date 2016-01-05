class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.961.tar.gz"
  sha256 "e4d010ab982d7ee37aa8a3442effdbe7511f11c355343d186a310be21158e85d"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
  
  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

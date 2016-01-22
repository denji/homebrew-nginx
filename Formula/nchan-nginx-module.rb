class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.98.tar.gz"
  sha256 "5d1b9c61fe0f6a29fd5f3fca781bc362b433c9b3d86023e2ec7e1037f7ad4b93"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

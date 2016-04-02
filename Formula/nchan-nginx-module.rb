class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.99.10.tar.gz"
  sha256 "b40ad3e7b72a1f7fdd1371416fdc54ad51e3ab68fea81337c20a6001e8c90d20"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

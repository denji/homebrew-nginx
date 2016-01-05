class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.97.tar.gz"
  sha256 "4dac85671667617d05e18d6bdbf1946372d3df3a01c0d55cd63a594e45bdd0b7"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

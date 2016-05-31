class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.99.15.tar.gz"
  sha256 "eb43ec3ed3f088c104fdf55eb2c48e9b6867f07f54d4d6eca554dcdc1297c69b"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end

  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

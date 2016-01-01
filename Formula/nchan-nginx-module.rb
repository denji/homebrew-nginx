class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v0.96.tar.gz"
  sha256 "5944cae0a6ab4e48ccff6e834ea559efb175c4ceb34c76b3538556790a2146ca"

  bottle :unneeded

  def install
    (share+"nchan-nginx-module").install Dir["*"]
  end
  
  test do
    File.exist?(share/"nchan-nginx-module/config")
  end
end

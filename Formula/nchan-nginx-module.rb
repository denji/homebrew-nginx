class NchanNginxModule < Formula
  desc "fast, flexible pub/sub server"
  homepage "https://nchan.slact.net"
  url "https://github.com/slact/nchan/archive/v1.0.0.tar.gz"
  sha256 "f3044458fb9bf1d19d5f577cd7e7b4beda66cc172b5fbf7027581cd8f3cc6405"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end

  test do
    File.exist?pkgshare
  end
end

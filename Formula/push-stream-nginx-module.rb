class PushStreamNginxModule < Formula
  desc "pure stream http push technology"
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.5.1.tar.gz"
  sha256 "a95f31e80120fd7324795b92a0d94c0b43e1265df7fd0f1eba11a337c1e0a626"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

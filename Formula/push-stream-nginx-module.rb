class PushStreamNginxModule < Formula
  desc "pure stream http push technology"
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.5.4.tar.gz"
  sha256 "5253bb8a804ea679e514137a234637298f044c3ef63c053670bf3802ff3535b1"

  def install
    pkgshare.install Dir["*"]
  end
end

class PushStreamNginxModule < Formula
  desc "Pure stream http push technology"
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.5.5.tar.gz"
  sha256 "90221413bc70a5eaf689c387aab4817789d460e29decee14d678e04d3a9b6a89"

  def install
    pkgshare.install Dir["*"]
  end
end

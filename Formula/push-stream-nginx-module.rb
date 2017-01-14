class PushStreamNginxModule < Formula
  desc "pure stream http push technology"
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.5.2.tar.gz"
  sha256 "1d07f38acdb8194bd49344b0ba21de101070de9b8731d27a8d22e928850bc199"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

require "formula"

class PushStreamNginxModule < Formula
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.4.1.tar.gz"
  sha1 "ee1e5a13fae891713493fd6f30f85358e98b0963"

  def install
    (share+"push-stream-nginx-module").install Dir["*"]
  end
end

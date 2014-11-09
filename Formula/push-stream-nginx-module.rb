require "formula"

class PushStreamNginxModule < Formula
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/master.tar.gz"
  sha1 "9d46577c650525b23161dd89d37ca9454dde1f0e"
  version "0.4.1-pre"	# has commit 467376d3c2 fixing clang link errors

  def install
    (share+"push-stream-nginx-module").install Dir["*"]
  end
end

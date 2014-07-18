require 'formula'

class PushStreamNginxModule < Formula
  homepage 'https://github.com/wandenberg/nginx-push-stream-module'
  url 'https://github.com/wandenberg/nginx-push-stream-module/archive/master.zip'
  sha1 '17812cd68297c67a595d6a580f138cc9cc382927'
  version '0.4.1-pre'	# has commit 467376d3c2 fixing clang link errors

  def install
    (share+'push-stream-nginx-module').install Dir['*']
  end
end

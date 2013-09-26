require 'formula'

class EchoNginxModule < Formula

  homepage 'https://github.com/agentzh/echo-nginx-module'
  url 'https://github.com/agentzh/echo-nginx-module/archive/v0.48.tar.gz'
  sha1 '51c6df070d15dfd63a6c5c17ed683a08e6dd86e8'

  def install
    (share+'echo-nginx-module').install Dir['*']
  end

end

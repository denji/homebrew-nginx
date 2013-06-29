require 'formula'

class EchoNginxModule < Formula

  homepage 'https://github.com/agentzh/echo-nginx-module'
  url 'https://github.com/agentzh/echo-nginx-module/archive/v0.45.tar.gz'
  sha1 '1182b2a7d32906f0bcaf26f82b4ccc9b28e25e57'

  def install
    (share+'echo-nginx-module').install Dir['*']
  end

  test do
    system "false"
  end
end

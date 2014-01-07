require 'formula'

class PhpSessionNginxModule < Formula
  homepage 'https://github.com/replay/ngx_http_php_session'
  url 'https://github.com/replay/ngx_http_php_session/archive/30f69b3bbe.tar.gz'
  sha1 '0a07677df689477b6b5123dbdb41271352b047e6'

  def install
    (share+'php-session-nginx-module').install Dir['*']
  end
end

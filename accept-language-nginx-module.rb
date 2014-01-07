require 'formula'

class AcceptLanguageNginxModule < Formula
  homepage 'https://github.com/giom/nginx_accept_language_module'
  url 'https://github.com/giom/nginx_accept_language_module/tarball/master/giom-nginx_accept_language_module-2f69842.tar.gz'
  sha1 'badac1f89639388bb518f68482e659b97d7968c2'

  def install
    (share+'accept-language-nginx-module').install Dir['*']
  end
end

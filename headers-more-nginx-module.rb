require 'formula'

class HeadersMoreNginxModule < Formula
  homepage 'https://github.com/agentzh/headers-more-nginx-module'
  url 'https://github.com/agentzh/headers-more-nginx-module/archive/v0.22.tar.gz'
  sha1 '9e574fb0a3cacb4229fa2fe93d02bac0d43e431f'

  def install
    (share+'headers-more-nginx-module').install Dir['*']
  end
end

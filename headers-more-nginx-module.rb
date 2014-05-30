require 'formula'

class HeadersMoreNginxModule < Formula
  homepage 'https://github.com/openresty/headers-more-nginx-module'
  url 'https://github.com/openresty/headers-more-nginx-module/archive/v0.25.tar.gz'
  sha1 '514bc3df30b24eb0a06533f1ebaa579b898990f5'

  def install
    (share+'headers-more-nginx-module').install Dir['*']
  end
end

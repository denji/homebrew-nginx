require 'formula'

class FancyIndexNginxModule < Formula

  homepage 'https://github.com/aperezdc/ngx-fancyindex'
  url 'https://github.com/aperezdc/ngx-fancyindex/archive/v0.3.2.tar.gz'
  sha1 '98c3c361ac163a49bada0dc25e81f7575cb8ff85'

  def install
    (share+'fancyindex-nginx-module').install Dir['*']
  end

end

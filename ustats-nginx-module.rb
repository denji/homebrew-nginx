require 'formula'

class UstatsNginxModule < Formula
  homepage 'https://github.com/denji/ngx_ustats_module'
  url 'https://github.com/denji/ngx_ustats_module/archive/0.1a.tar.gz'
  sha1 'b1d574ed613c15ccc9795513aacd22e896b15759'
  version '0.1'

  def install
    (share+'ustats-nginx-module').install Dir['*']
  end
end

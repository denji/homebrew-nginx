require 'formula'

class DosdetectorNginxModule < Formula
  homepage 'https://github.com/cubicdaiya/ngx_dosdetector'
  url 'https://github.com/cubicdaiya/ngx_dosdetector/archive/91a40e87c1.tar.gz'
  sha1 'e476ecc2e3b38667bae0edd452116d14e75e450c'
  version '0.1'

  def install
    (share+'dosdetector-nginx-module').install Dir['*']
  end
end

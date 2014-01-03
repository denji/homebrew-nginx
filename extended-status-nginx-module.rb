require 'formula'

class ExtendedStatusNginxModule < Formula
  homepage 'https://github.com/zealot83/ngx_http_extended_status_module'
  url 'https://github.com/zealot83/ngx_http_extended_status_module/archive/gh-pages.tar.gz'

  sha1 'ed4a6a62accd23fc85bf2bf5d7a09c21f87267d5'

  def install
    (share+'extended-status-nginx-module').install Dir['*']
  end

end

require 'formula'

class ExtStatusNginxModule < Formula
  homepage 'https://github.com/denji/ngx_http_extended_status_module'
  url 'https://github.com/denji/ngx_http_extended_status_module/archive/v1.0.tar.gz'
  sha1 '884f39921be512a4939be93bb0a5b64bf68fff06'

  def patches
    "https://raw.github.com/denji/ngx_http_extended_status_module/master/extended_status-1.5.2.patch"
  end

  def install
    (share+'ext-status-nginx-module').install Dir['*']
  end
end

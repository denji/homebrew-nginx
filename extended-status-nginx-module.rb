require 'formula'

class ExtendedStatusNginxModule < Formula
  homepage 'https://github.com/denji/ngx_http_extended_status_module'
  url 'https://github.com/denji/ngx_http_extended_status_module/archive/v1.0.tar.gz'
  sha1 '884f39921be512a4939be93bb0a5b64bf68fff06'

  def patches
    "https://raw.github.com/denji/ngx_http_extended_status_module/master/extended_status-1.4.2.patch" if build.stable?
    "https://raw.github.com/denji/ngx_http_extended_status_module/master/extended_status-1.5.2.patch" if build.devel?
  end

  if build.head?
    cause "extended-status-nginx-module: not support --HEAD version"
  end

  def install
    (share+'extended-status-nginx-module').install Dir['*']
  end
end

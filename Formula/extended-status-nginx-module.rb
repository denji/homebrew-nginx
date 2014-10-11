require "formula"

class ExtendedStatusNginxModule < Formula
  homepage "https://github.com/denji/ngx_http_extended_status_module"
  url "https://github.com/denji/ngx_http_extended_status_module/archive/v1.0.tar.gz"
  sha1 "884f39921be512a4939be93bb0a5b64bf68fff06"

  stable do
    patch do
      url "https://raw.github.com/denji/ngx_http_extended_status_module/master/extended_status-1.4.2.patch"
      sha1 "6bf980298926325387ed7631a687d4788b3b4f62"
    end
  end

  devel do
    patch do
      url "https://raw.github.com/denji/ngx_http_extended_status_module/master/extended_status-1.5.2.patch"
      sha1 "cb8d752df1111fd64f6fcf5986424f21e0d42cbd"
    end
  end

  if build.head?
    cause "extended-status-nginx-module: not support --HEAD version"
  end

  def install
    (share+"extended-status-nginx-module").install Dir["*"]
  end
end

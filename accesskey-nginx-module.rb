require 'formula'

class AccessKeyNginxModule < Formula

  homepage 'http://wiki.nginx.org/NginxHttpAccessKeyModule'
  url 'http://wiki.nginx.org/images/5/51/Nginx-accesskey-2.0.3.tar.gz'
  sha1 '68eb4c47f9a1a058a711b280d4e29339ddab8775'

  def install
    (share+'accesskey-nginx-module').install Dir['*']
  end

end

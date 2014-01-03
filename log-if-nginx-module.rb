require 'formula'

class LogIfNginxModule < Formula

  homepage 'https://github.com/cfsego/ngx_log_if'
  url 'https://github.com/cfsego/ngx_log_if/archive/master.tar.gz'
  sha1 '8dfb8c0f9358821377c0dea810a49a026aecd405'

  def install
    (share+'log-if-nginx-module').install Dir['*']
  end

end

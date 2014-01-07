require 'formula'

class SubsFilterNginxModule < Formula
  homepage 'https://github.com/yaoweibin/ngx_http_substitutions_filter_module'
  url 'https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/master.tar.gz'
  sha1 '8ac8efa385c8b0fcfcd6a7505697bcfe498039e3'
  version '0.6.3' # devel version without pcre depend

  def install
    (share+'auth-digest-nginx-module').install Dir['*']
  end
end

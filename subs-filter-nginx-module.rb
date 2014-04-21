require 'formula'

class SubsFilterNginxModule < Formula
  homepage 'https://github.com/yaoweibin/ngx_http_substitutions_filter_module'
  url 'https://github.com/yaoweibin/ngx_http_substitutions_filter_module/archive/master.tar.gz'
  sha1 'e2dd7540314b6629ab9919de6566eb2ab85c03d0'
  version '0.6.3' # devel version without pcre depend

  def install
    (share+'subs-filter-nginx-module').install Dir['*']
  end
end

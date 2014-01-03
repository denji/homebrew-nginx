require 'formula'

class PagespeedNginxModule < Formula
  homepage 'https://github.com/pagespeed/ngx_pagespeed'
  url 'https://github.com/pagespeed/ngx_pagespeed/archive/v1.7.30.2-beta.tar.gz'

  sha1 '276709d665293b2f529b6f92fb5ade61d4fea08b'

  # base psol library
  class PsolModule < Formula
    url 'https://dl.google.com/dl/page-speed/psol/1.7.30.1.tar.gz'
    sha1 'fd0fa589550a14fa18efb4548943fffa821a45a6'
  end

  def install
    PsolModule.new.brew do
      (share+'pagespeed-nginx-module/psol').install Dir['*']
    end

    #inreplace 'config' do |s|
    #  s.gsub! /ngx_addon_dir\/psol/, ''
    #end

    (share+'pagespeed-nginx-module').install Dir['*']
  end

end

require 'formula'

class CaptchaNginxModule < Formula
  homepage 'https://github.com/fallgold/ngx_http_captcha'
  url 'https://github.com/fallgold/ngx_http_captcha/archive/0fbd025edb.tar.gz'
  sha1 'a984facfc5cbf82fca383fb2c09e98ca03c69613'

  depends_on 'imagemagick'

  def install
    (share+'captcha-nginx-module').install Dir['*']
  end
end

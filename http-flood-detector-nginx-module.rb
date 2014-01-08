require 'formula'

class HttpFloodDetectorNginxModule < Formula
  homepage 'https://github.com/suehiro/ngx_http_flood_detector_module'
  url 'https://github.com/alexstup/ngx_http_var_request_speed/archive/ad1abbc81b.tar.gz'
  sha1 ''

   if !build.with? 'with-status'
    cause "http-flood-detector-nginx-module: Stub Status module is required `--with-status`"
   end

  def install
    (share+'http-flood-detector-nginx-module').install Dir['*']
  end
end

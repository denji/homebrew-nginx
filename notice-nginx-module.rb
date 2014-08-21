require "formula"

class NoticeNginxModule < Formula
  homepage "https://github.com/kr/nginx-notice"
  url "https://github.com/kr/nginx-notice/archive/master.tar.gz"
  sha1 "ed64e7caffc8cf46bf2ebf7987f59a32952a55a8"
  version "0.0.2"

  # Fix issue compatibility
  def patches; DATA end

  def install
    (share+"notice-nginx-module").install Dir["*"]
  end
end

__END__
--- ../kr-nginx-notice-3c95966/ngx_http_notice_module.c.orig	2009-07-16 18:37:57.000000000 +0200
+++ ../kr-nginx-notice-3c95966/ngx_http_notice_module.c	2009-07-16 08:09:38.000000000 +0200
@@ -153,7 +153,7 @@
         return NGX_HTTP_NOT_ALLOWED;
     }
 
-    rc = ngx_http_discard_body(r);
+    rc = ngx_http_discard_request_body(r);
 
     if (rc != NGX_OK && rc != NGX_AGAIN) {
         return rc;

require "formula"

class Mp4H264NginxModule < Formula
  homepage "http://h264.code-shop.com/trac/wiki/Mod-H264-Streaming-Nginx-Version2"
  url "http://h264.code-shop.com/download/nginx_mod_h264_streaming-2.2.7.tar.gz"
  sha1 "c887af256b1d6302149efc8159cc6c7ba1e7d439"

  # Fix issue compatibility
  def patches; DATA end

  def install
    (share+"mp4-h264-nginx-module").install Dir["*"]
  end
end

__END__
--- ../nginx_mod_h264_streaming-2.2.7/src/ngx_http_streaming_module.c.orig	2010-05-24 18:04:43.000000000 +0400
+++ ../nginx_mod_h264_streaming-2.2.7/src/ngx_http_streaming_module.c	2010-05-24 18:05:02.000000000 +0400
@@ -155,10 +155,6 @@
   }

   /* TODO: Win32 */
-  if (r->zero_in_uri)
-  {
-    return NGX_DECLINED;
-  }

   rc = ngx_http_discard_request_body(r);


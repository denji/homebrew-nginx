require "formula"

class Mp4H264NginxModule < Formula
  homepage "http://h264.code-shop.com/trac/wiki/Mod-H264-Streaming-Nginx-Version2"
  url "http://h264.code-shop.com/download/nginx_mod_h264_streaming-2.2.7.tar.gz"
  sha1 "c887af256b1d6302149efc8159cc6c7ba1e7d439"

  # Fix issue compatibility
  patch :DATA

  def install
    (share+"mp4-h264-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/src/ngx_http_streaming_module.c b/src/ngx_http_streaming_module.c
index 8d565c9..a8df30e 100644
--- a/src/ngx_http_streaming_module.c
+++ b/src/ngx_http_streaming_module.c
@@ -155,10 +155,6 @@ static ngx_int_t ngx_streaming_handler(ngx_http_request_t *r)
   }
 
   /* TODO: Win32 */
-  if (r->zero_in_uri)
-  {
-    return NGX_DECLINED;
-  }
 
   rc = ngx_http_discard_request_body(r);
 

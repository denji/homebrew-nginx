class Mp4H264NginxModule < Formula
  desc "H264 Streaming Module plugin for Nginx"
  homepage "http://h264.code-shop.com/trac/wiki/Mod-H264-Streaming-Nginx-Version2"
  url "http://h264.code-shop.com/download/nginx_mod_h264_streaming-2.2.7.tar.gz"
  sha256 "6d974ba630cef59de1f60996c66b401264a345d25988a76037c2856cec756c19"

  # Fix issue compatibility
  patch :DATA

  def install
    pkgshare.install Dir["*"]
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


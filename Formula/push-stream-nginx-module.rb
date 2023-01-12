class PushStreamNginxModule < Formula
  desc "Pure stream http push technology"
  homepage "https://github.com/wandenberg/nginx-push-stream-module"
  url "https://github.com/wandenberg/nginx-push-stream-module/archive/0.5.5.tar.gz"
  sha256 "90221413bc70a5eaf689c387aab4817789d460e29decee14d678e04d3a9b6a89"

  def install
    pkgshare.install Dir["*"]
  end
end

__END__
diff --git a/src/ngx_http_push_stream_module_utils.c b/src/ngx_http_push_stream_module_utils.c
index fdf8de9..5fee879 100644
--- a/src/ngx_http_push_stream_module_utils.c
+++ b/src/ngx_http_push_stream_module_utils.c
@@ -2149,8 +2149,12 @@ ngx_http_push_stream_set_expires(ngx_http_request_t *r, ngx_http_push_stream_exp
 {
     size_t            len;
     time_t            now, expires_header_time, max_age;
+#if (nginx_version >= 1023000)
+    ngx_table_elt_t  *expires_header, *cc;
+#else
     ngx_uint_t        i;
     ngx_table_elt_t  *expires_header, *cc, **ccp;
+#endif
 
     expires_header = r->headers_out.expires;
 
@@ -2170,6 +2174,32 @@ ngx_http_push_stream_set_expires(ngx_http_request_t *r, ngx_http_push_stream_exp
     len = sizeof("Mon, 28 Sep 1970 06:00:00 GMT");
     expires_header->value.len = len - 1;
 
+#if (nginx_version >= 1023000)
+    cc = r->headers_out.cache_control;
+
+    if (cc == NULL) {
+
+        cc = ngx_list_push(&r->headers_out.headers);
+        if (cc == NULL) {
+            expires_header->hash = 0;
+            return NGX_ERROR;
+        }
+
+        r->headers_out.cache_control = cc;
+        cc->next = NULL;
+
+        cc->hash = 1;
+        ngx_str_set(&cc->key, "Cache-Control");
+
+    } else {
+        for (cc = cc->next; cc; cc = cc->next) {
+            cc->hash = 0;
+        }
+
+        cc = r->headers_out.cache_control;
+        cc->next = NULL;
+    }
+#else
     ccp = r->headers_out.cache_control.elts;
 
     if (ccp == NULL) {
@@ -2199,6 +2229,8 @@ ngx_http_push_stream_set_expires(ngx_http_request_t *r, ngx_http_push_stream_exp
 
         cc = ccp[0];
     }
+#endif
+
 
     if (expires == NGX_HTTP_PUSH_STREAM_EXPIRES_EPOCH) {
         expires_header->value.data = (u_char *) "Thu, 01 Jan 1970 00:00:01 GMT";

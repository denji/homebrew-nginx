class WebsockifyNginxModule < Formula
  homepage "https://github.com/tg123/websockify-nginx-module"
  url "https://github.com/tg123/websockify-nginx-module/archive/v0.0.2.tar.gz"
  sha1 "70a5eadcc744209f4f2737b6d987f4fa2e50e2ed"
  revision 1

  # fix timer leak
  patch :DATA

  def install
    (share+"websockify-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/ngx_http_websockify_module.c b/ngx_http_websockify_module.c
index 6a3f1df..e1c2839 100644
--- a/ngx_http_websockify_module.c
+++ b/ngx_http_websockify_module.c
@@ -145,6 +145,10 @@ ngx_http_websockify_flush_upstream(ngx_http_websockify_ctx_t *ctx)
     ngx_http_request_t        *r;
     r = ctx->request;
 
+    if (ctx->closed) {
+        return NGX_ERROR;
+    }
+
     if ( r->upstream->peer.connection ) {
         return ngx_http_websockify_send(r->upstream->peer.connection,
                                         ctx->decode_send_buf, ctx->original_ngx_upstream_send);
@@ -282,8 +286,8 @@ ngx_http_websockify_send_downstream_with_encode(ngx_connection_t *c,
     free_size = ngx_min(free_size,
                         MAX_WEBSOCKET_FRAME_SIZE + MAX_WEBSOCKET_FRAME_HEADER_SIZE);
 
-    // TODO clean up code, UGLY
-    if (ctx->encoding_protocol == WEBSOCKIFY_ENCODING_PROTOCOL_BASE64) {
+    switch (ctx->encoding_protocol) {
+    case WEBSOCKIFY_ENCODING_PROTOCOL_BASE64:
 
         // inverse of ngx_base64_encoded_length.
         consumed_size  = ngx_min(websocket_payload_consume_size(free_size) / 4 * 3 - 2,
@@ -306,7 +310,10 @@ ngx_http_websockify_send_downstream_with_encode(ngx_connection_t *c,
 
         ngx_encode_base64(&dst, &src);
 
-    } else {
+        break;
+
+    case WEBSOCKIFY_ENCODING_PROTOCOL_BINARY:
+
         consumed_size = ngx_min(websocket_payload_consume_size(free_size), size);
 
         payload_length = consumed_size;
@@ -316,6 +323,13 @@ ngx_http_websockify_send_downstream_with_encode(ngx_connection_t *c,
                                             payload_length);
 
         ngx_memcpy(b->last + header_length, buf, consumed_size);
+
+        break;
+
+    default:
+        // not support
+        return NGX_ERROR;
+        break;
     }
 
     b->last += header_length + payload_length; // push encoded data into buffer
@@ -338,6 +352,7 @@ ngx_http_websockify_send_upstream_with_decode(ngx_connection_t *c, u_char *buf,
 
     ssize_t                          header_length;
     size_t                           used_buf_size;
+    size_t                           need_buf_size;
     ssize_t                          reply;
 
     ngx_log_debug2(NGX_LOG_DEBUG_HTTP, c->log, 0, "%s: [%d]", WEBSOCKIFY_FUNC,
@@ -376,20 +391,39 @@ ngx_http_websockify_send_upstream_with_decode(ngx_connection_t *c, u_char *buf,
 
     case WEBSOCKET_OPCODE_TEXT:
     case WEBSOCKET_OPCODE_BINARY:
-        // FIXME when client send a frame > buffer_size can not hold
-        // current frame remaining data, the connection will hang, should log an error
 
-        if (ctx->encoding_protocol == WEBSOCKIFY_ENCODING_PROTOCOL_BASE64) {
-            ngx_str_t src;
-            ngx_str_t dst;
+        switch (ctx->encoding_protocol) {
+        case WEBSOCKIFY_ENCODING_PROTOCOL_BASE64:
+            need_buf_size = ngx_base64_decoded_length(frame.payload_length);
+            break;
+        case WEBSOCKIFY_ENCODING_PROTOCOL_BINARY:
+            need_buf_size = frame.payload_length;
+            break;
+        default:
+            return NGX_ERROR;
+            break;
+        }
 
-            // base64 decode the data
-            if ( !ngx_http_websockify_freesize(b,
-                                               ngx_base64_decoded_length(frame.payload_length)) ) {
-                return NGX_AGAIN;
+        if ( !ngx_http_websockify_freesize(b, need_buf_size) ) {
+
+            if (need_buf_size + b->start > b->end) {
+                ngx_log_error(NGX_LOG_ERR, c->log, 0, "%s: buffer size too small",
+                              WEBSOCKIFY_FUNC);
+                return NGX_ERROR;
             }
 
-            websocket_server_decode_unmask_payload(&frame);
+            return NGX_AGAIN;
+        }
+
+        websocket_server_decode_unmask_payload(&frame);
+
+
+        switch (ctx->encoding_protocol) {
+        case WEBSOCKIFY_ENCODING_PROTOCOL_BASE64:;
+
+            // base64 decode the data
+            ngx_str_t src;
+            ngx_str_t dst;
 
             src.data = frame.payload;
             src.len =  frame.payload_length;
@@ -403,20 +437,19 @@ ngx_http_websockify_send_upstream_with_decode(ngx_connection_t *c, u_char *buf,
             }
 
             used_buf_size = dst.len;
-
-        } else {
-
-            if ( !ngx_http_websockify_freesize(b, frame.payload_length) ) {
-                return NGX_AGAIN;
-            }
-
-            websocket_server_decode_unmask_payload(&frame);
-
+            break;
+        case WEBSOCKIFY_ENCODING_PROTOCOL_BINARY:
             ngx_memcpy(b->last, frame.payload, frame.payload_length);
 
             used_buf_size = frame.payload_length;
+
+            break;
+        default:
+            return NGX_ERROR;
+            break;
         }
 
+
         break;
 
     case WEBSOCKET_OPCODE_CLOSE:
@@ -713,15 +746,15 @@ ngx_http_websockify_handler(ngx_http_request_t *r)
 
     u->conf = &wlcf->upstream;
 
-    u->create_request = ngx_http_websockify_create_request;
-    u->reinit_request = ngx_http_websockify_reinit_request;
-    u->process_header = ngx_http_websockify_process_header;
-    u->abort_request = ngx_http_websockify_abort_request;
+    u->create_request   = ngx_http_websockify_create_request;
+    u->reinit_request   = ngx_http_websockify_reinit_request;
+    u->process_header   = ngx_http_websockify_process_header;
+    u->abort_request    = ngx_http_websockify_abort_request;
     u->finalize_request = ngx_http_websockify_finalize_request;
 
     r->upstream = u;
 
-    ctx = ngx_palloc(r->pool, sizeof(ngx_http_websockify_ctx_t));
+    ctx = ngx_pcalloc(r->pool, sizeof(ngx_http_websockify_ctx_t));
     if (ctx == NULL) {
         return NGX_HTTP_INTERNAL_SERVER_ERROR;
     }
@@ -972,6 +1005,15 @@ ngx_http_websockify_abort_request(ngx_http_request_t *r)
 static void
 ngx_http_websockify_finalize_request(ngx_http_request_t *r, ngx_int_t rc)
 {
+    ngx_http_websockify_ctx_t       *ctx;
+
+    ctx = ngx_http_get_module_ctx(r, ngx_http_websockify_module);
+    ctx->closed = 1;
+
+    if (ctx->flush_all_ev.timer_set) {
+        ngx_del_timer(&(ctx->flush_all_ev));
+    }
+
     return;
 }
 
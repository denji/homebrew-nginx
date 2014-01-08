require 'formula'

class TcpProxyNginxModule < Formula
  homepage 'https://github.com/yaoweibin/nginx_tcp_proxy_module'
  url 'https://github.com/yaoweibin/nginx_tcp_proxy_module/archive/v0.26.tar.gz'
  sha1 '3997b93b6421d0afa69e7fd79a952c16a1f5db1b'

  # Fix issue compatibility
  def patches; DATA end

  def install
    (share+'tcp-proxy-nginx-module').install Dir['*']
  end
end

__END__
--- a/src/core/ngx_log.c
+++ b/src/core/ngx_log.c
@@ -66,7 +66,7 @@ static ngx_str_t err_levels[] = {

 static const char *debug_levels[] = {
     "debug_core", "debug_alloc", "debug_mutex", "debug_event",
-    "debug_http", "debug_mail", "debug_mysql"
+    "debug_http", "debug_mail", "debug_mysql", "debug_tcp"
 };


--- a/src/core/ngx_log.h
+++ b/src/core/ngx_log.h
@@ -29,6 +29,7 @@
 #define NGX_LOG_DEBUG_HTTP        0x100
 #define NGX_LOG_DEBUG_MAIL        0x200
 #define NGX_LOG_DEBUG_MYSQL       0x400
+#define NGX_LOG_DEBUG_TCP         0x800

 /*
  * do not forget to update debug_levels[] in src/core/ngx_log.c
@@ -36,7 +37,7 @@
  */

 #define NGX_LOG_DEBUG_FIRST       NGX_LOG_DEBUG_CORE
-#define NGX_LOG_DEBUG_LAST        NGX_LOG_DEBUG_MYSQL
+#define NGX_LOG_DEBUG_LAST        NGX_LOG_DEBUG_TCP
 #define NGX_LOG_DEBUG_CONNECTION  0x80000000
 #define NGX_LOG_DEBUG_ALL         0x7ffffff0

--- a/src/event/ngx_event_connect.h
+++ b/src/event/ngx_event_connect.h
@@ -32,6 +32,7 @@ typedef void (*ngx_event_save_peer_session_pt)(ngx_peer_connection_t *pc,
     void *data);
 #endif

+#define NGX_INVALID_CHECK_INDEX (ngx_uint_t)(-1)

 struct ngx_peer_connection_s {
     ngx_connection_t                *connection;
@@ -42,6 +43,8 @@ struct ngx_peer_connection_s {

     ngx_uint_t                       tries;

+    ngx_uint_t                       check_index;
+
     ngx_event_get_peer_pt            get;
     ngx_event_free_peer_pt           free;
     void                            *data;

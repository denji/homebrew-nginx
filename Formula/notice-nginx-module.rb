class NoticeNginxModule < Formula
  desc "Nginx module to display notices of downtime"
  homepage "https://github.com/kr/nginx-notice"
  url "https://github.com/kr/nginx-notice/archive/3c95966.tar.gz"
  version "0.0.2"
  sha256 "c520f7905f569f1590442a7c3ac3ef54a977fb306f3adb9c2ba008d4481939ac"

  # Fix issue compatibility
  patch :DATA

  def install
    pkgshare.install Dir["*"]
  end
end

__END__
diff --git a/ngx_http_notice_module.c b/ngx_http_notice_module.c
index 0c84f8d..e795da0 100644
--- a/ngx_http_notice_module.c
+++ b/ngx_http_notice_module.c
@@ -153,7 +153,7 @@ ngx_http_notice_handler(ngx_http_request_t *r)
         return NGX_HTTP_NOT_ALLOWED;
     }
 
-    rc = ngx_http_discard_body(r);
+    rc = ngx_http_discard_request_body(r);
 
     if (rc != NGX_OK && rc != NGX_AGAIN) {
         return rc;

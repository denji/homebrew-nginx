class AuthDigestNginxModule < Formula
  homepage "https://github.com/samizdatco/nginx-http-auth-digest"
  url "https://github.com/samizdatco/nginx-http-auth-digest/archive/master.tar.gz"
  sha1 "3188e07820d5a06f8328f61875dbb91d4a74b6c0"
  revision 1
  version "0.1"

  patch :DATA

  def install
    (share+"auth-digest-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/ngx_http_auth_digest_module.c b/ngx_http_auth_digest_module.c
index 28eb587..1680a29 100644
--- a/ngx_http_auth_digest_module.c
+++ b/ngx_http_auth_digest_module.c
@@ -403,11 +403,11 @@ ngx_http_auth_digest_verify_hash(ngx_http_request_t *r, ngx_http_auth_digest_cre
   if (http_method.data==NULL) return NGX_HTTP_INTERNAL_SERVER_ERROR;
   p = ngx_cpymem(http_method.data, r->method_name.data, r->method_end - r->method_name.data+1);

-  ha2_key.len = http_method.len + r->uri.len + 1;
+  ha2_key.len = http_method.len + fields->uri.len;
   ha2_key.data = ngx_pcalloc(r->pool, ha2_key.len);
   if (ha2_key.data==NULL) return NGX_HTTP_INTERNAL_SERVER_ERROR;
   p = ngx_cpymem(ha2_key.data, http_method.data, http_method.len-1); *p++ = ':';
-  p = ngx_cpymem(p, r->uri.data, r->uri.len);
+  p = ngx_cpymem(p, fields->uri.data, fields->uri.len-1);

   HA2.len = 33;
   HA2.data = ngx_pcalloc(r->pool, HA2.len);
@@ -487,11 +487,11 @@ ngx_http_auth_digest_verify_hash(ngx_http_request_t *r, ngx_http_auth_digest_cre
     // recalculate the digest with a modified HA2 value (for rspauth) and emit the
     // Authentication-Info header
     ngx_memset(ha2_key.data, 0, ha2_key.len);
-    p = ngx_sprintf(ha2_key.data, ":%s", r->uri.data);
+    p = ngx_sprintf(ha2_key.data, ":%s", fields->uri.data);

     ngx_memset(HA2.data, 0, HA2.len);
     ngx_md5_init(&md5);
-    ngx_md5_update(&md5, ha2_key.data, r->uri.len);
+    ngx_md5_update(&md5, ha2_key.data, fields->uri.len-1);
     ngx_md5_final(hash, &md5);
     ngx_hex_dump(HA2.data, hash, 16);


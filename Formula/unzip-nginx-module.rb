require "formula"

class UnzipNginxModule < Formula
  homepage "https://github.com/youzee/nginx-unzip-module"
  url "https://github.com/youzee/nginx-unzip-module/archive/7db8d6c02b9ea1060752632f32447c466517ace2.tar.gz"
  sha1 "b6f97d46d114ca432162dc909f34f6d4a2741c1b"
  version "0.1-pre"

  # Log messages before freeing data
  # https://github.com/youzee/nginx-unzip-module/pull/3
  patch :DATA

  def install
    (share+"unzip-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/ngx_http_unzip_module.c b/ngx_http_unzip_module.c
index 8150294..771e1dc 100644
--- a/ngx_http_unzip_module.c
+++ b/ngx_http_unzip_module.c
@@ -200,8 +200,8 @@ static ngx_int_t ngx_http_unzip_handler(ngx_http_request_t *r)
 
     unzipextract_path = malloc(unzip_extract.len+1);
     if (unzipextract_path == NULL) {
-        free(unzipfile_path);
         ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "Failed to allocate buffer.");
+        free(unzipfile_path);
         return NGX_HTTP_INTERNAL_SERVER_ERROR;
     }
 
@@ -214,9 +214,9 @@ static ngx_int_t ngx_http_unzip_handler(ngx_http_request_t *r)
 
     /* try to open archive (zip) file */
     if (!(zip_source = zip_open(unzipfile_path, 0, &err))) {
+        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "%s : no such archive file.", unzipfile_path);
         free(unzipfile_path);
         free(unzipextract_path);
-        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "%s : no such archive file.", unzipfile_path);
         return NGX_HTTP_NOT_FOUND;
     }
 
@@ -225,19 +225,19 @@ static ngx_int_t ngx_http_unzip_handler(ngx_http_request_t *r)
 
     /* let's check what's the size of a file. return 404 if we can't stat file inside archive */
     if (0 != zip_stat(zip_source, unzipextract_path, 0, &zip_st)) {
+        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "no file %s inside %s archive.", unzipextract_path, unzipfile_path);
         free(unzipfile_path);
         free(unzipextract_path);
         zip_close(zip_source);
-        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "no file %s inside %s archive.", unzipextract_path, unzipfile_path);
         return NGX_HTTP_NOT_FOUND;
     }
 
     /* allocate buffer for the file content */
     if (!(zip_content = ngx_palloc(r->pool, zip_st.size))) {
+        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "Failed to allocate response buffer memory.");
         free(unzipfile_path);
         free(unzipextract_path);
         zip_close(zip_source);
-        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "Failed to allocate response buffer memory.");
         return NGX_HTTP_INTERNAL_SERVER_ERROR;
     }
 
@@ -246,11 +246,11 @@ static ngx_int_t ngx_http_unzip_handler(ngx_http_request_t *r)
     *  so let's return 500.
     */
     if (!(file_in_zip = zip_fopen(zip_source, unzipextract_path, 0))) {
+        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "failed to open %s from %s archive (corrupted?).",
+                unzipextract_path, unzipfile_path);
         free(unzipfile_path);
         free(unzipextract_path);
         zip_close(zip_source);
-        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "failed to open %s from %s archive (corrupted?).",
-                unzipextract_path, unzipfile_path);
         return NGX_HTTP_INTERNAL_SERVER_ERROR;
     }
 
@@ -259,12 +259,12 @@ static ngx_int_t ngx_http_unzip_handler(ngx_http_request_t *r)
     *  we're expecting to get zip_st.size bytes so return 500 if we get something else.
     */
     if (!(zip_read_bytes = zip_fread(file_in_zip, zip_content, zip_st.size)) || zip_read_bytes != zip_st.size) {
+        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "couldn't get %d bytes of %s from %s archive (corrupted?).",
+                zip_st.size, unzipextract_path, unzipfile_path);
         free(unzipfile_path);
         free(unzipextract_path);
         zip_fclose(file_in_zip);
         zip_close(zip_source);
-        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0, "couldn't get %d bytes of %s from %s archive (corrupted?).",
-                zip_st.size, unzipextract_path, unzipfile_path);
         return NGX_HTTP_INTERNAL_SERVER_ERROR;
     }
 

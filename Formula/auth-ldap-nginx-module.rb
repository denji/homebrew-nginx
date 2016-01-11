class AuthLdapNginxModule < Formula
  desc "LDAP authentication module for nginx"
  homepage "https://github.com/kvspb/nginx-auth-ldap"
  url "https://github.com/kvspb/nginx-auth-ldap/archive/be8ff8e.tar.gz"
  version "be8ff8e"
  sha256 "02adfa17c7f9bc06ae2914ebe0b14a2965fd05127979826010bf9d9fefbfca8b"
  head "https://github.com/kvspb/nginx-auth-ldap.git"

  bottle :unneeded

  depends_on "openldap"

  # undefined reference to "_ber_sockbuf_add_io"
  # - https://github.com/Homebrew/homebrew-nginx/issues/93
  # - https://github.com/kvspb/nginx-auth-ldap/issues/26
  patch :DATA

  def install
    (share+"auth-ldap-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/config b/config
index 7931d74..2420bb6 100644
--- a/config
+++ b/config
@@ -5,7 +5,7 @@ NGX_ADDON_SRCS="$NGX_ADDON_SRCS $ngx_addon_dir/ngx_http_auth_ldap_module.c"
 CORE_LIBS="$CORE_LIBS -lldap"
 
 case "$NGX_PLATFORM" in
-    FreeBSD:*|Linux:*|SunOS:*)
+    Darwin:*|FreeBSD:*|Linux:*|SunOS:*)
         CORE_LIBS="$CORE_LIBS -llber"
     ;;
 esac

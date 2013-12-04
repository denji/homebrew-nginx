require 'formula'

class NginxFull < Formula

  homepage 'http://nginx.org/'
  url 'http://nginx.org/download/nginx-1.4.4.tar.gz'
  sha1 '304d5991ccde398af2002c0da980ae240cea9356'

  devel do
    url 'http://nginx.org/download/nginx-1.5.7.tar.gz'
    sha1 '4dd04c73c3081277fe9c98c4a386c8baf956f5ca'
  end

  head 'http://hg.nginx.org/nginx/', :using => :hg

  env :userpaths

  depends_on 'pcre'
  # SPDY needs openssl >= 1.0.1 for NPN; see:
  # https://tools.ietf.org/agenda/82/slides/tls-3.pdf
  # http://www.openssl.org/news/changelog.html
  depends_on 'openssl' if build.with? 'spdy'
  depends_on 'geoip' if build.with? 'geoip'
  depends_on 'libxml2' if build.with? 'xslt'
  depends_on 'libxslt' if build.with? 'xslt'
  depends_on 'gd' if build.with? 'image-filter'
  # 3rd party modules
  depends_on 'ngx-devel-kit' if build.include? 'with-lua-module' or build.include? 'with-array-var-module'
  depends_on 'lua-nginx-module' if build.include? 'with-lua-module'
  depends_on 'echo-nginx-module' if build.include? 'with-echo-module'
  depends_on 'auth-digest-nginx-module' if build.include? 'with-auth-digest'
  depends_on 'set-misc-nginx-module' if build.include? 'with-set-misc-module'
  depends_on 'redis2-nginx-module' if build.include? 'with-redis2-module'
  depends_on 'array-var-nginx-module' if build.include? 'with-array-var-module'
  depends_on 'accept-language-nginx-module' if build.include? 'with-accept-language'
  depends_on 'accesskey-nginx-module' if build.include? 'with-accesskey-module'
  depends_on 'auth-ldap-nginx-module' if build.include? 'with-auth-ldap'
  depends_on 'auth-pam-nginx-module' if build.include? 'with-auth-pam'
  depends_on 'cache-purge-nginx-module' if build.include? 'with-cache-purge'
  depends_on 'ctpp2-nginx-module' if build.include? 'with-ctpp2-module'
  depends_on 'headers-more-nginx-module' if build.include? 'with-headers-more-module'
  depends_on 'dav-ext-nginx-module' if build.include? 'with-webdav'
  depends_on 'eval-nginx-module' if build.include? 'with-eval-module'
  depends_on 'fancyindex-nginx-module' if build.include? 'with-fancyindex-module'
  depends_on 'mogilefs-nginx-module' if build.include? 'with-mogilefs-module'
  depends_on 'mp4-h264-nginx-module' if build.include? 'with-mp4-h264-module'
  depends_on 'notice-nginx-module' if build.include? 'with-notice-module'
  depends_on 'subs-filter-nginx-module' if build.include? 'with-subs-filter-module'

  skip_clean 'logs'

  # Options
  def options_array
    option_data = [
      # 3rd party modules
      ['with-passenger',          nil,                           'Compile with support for Phusion Passenger module'],
      ['with-lua-module',         nil,                           'Compile with support for LUA module'],
      ['with-echo-module',        nil,                           'Compile with support for Echo Module'],
      ['with-auth-digest',        nil,                           'Compile with support for Auth Digest Module'],
      ['with-set-misc-module',    nil,                           'Compile with support for Set Misc Module'],
      ['with-redis2-module',      nil,                           'Compile with support for Redis2 Module'],
      ['with-array-var-module',   nil,                           'Compile with support for Array Var Module']
      ['with-accept-language',    nil,                           'Compile with support for Accept Language Module'],
      ['with-accesskey-module',   nil,                           'Compile with support for HTTP Access Key Module'],
      ['with-auth-ldap',          nil,                           'Compile with support for Auth LDAP Module'],
      ['with-auth-pam',           nil,                           'Compile with support for Auth PAM Module'],
      ['with-cache-purge',        nil,                           'Compile with support for Cache Purge Module'],
      ['with-ctpp2-module',       nil,                           'Compile with support for CT++ Module'],
      ['with-headers-more-module',nil,                           'Compile with support for Headers More Module'],
      ['with-dav-ext-module',     nil,                           'Compile with support for HTTP WebDav Extended Module'],
      ['with-eval-module',        nil,                           'Compile with support for Eval Module'],
      ['with-fancyindex-module',  nil,                           'Compile with support for Fancy Index Module'],
      ['with-mogilefs-module',    nil,                           'Compile with support for HTTP MogileFS Module'],
      ['with-mp4-h264-module',    nil,                           'Compile with support for HTTP MP4/H264 Module'],
      ['with-notice-module',      nil,                           'Compile with support for HTTP Notice Module'],
      ['with-subs-filter',        nil,                           'Compile with support for Substitutions Filter Module'],
      # Internal modules
      ['with-webdav',            'with-http_dav_module',         'Compile with support for WebDAV module'],
      ['with-debug',             'with-debug',                   'Compile with support for debug log'],
      ['with-spdy',              'with-http_spdy_module',        'Compile with support for SPDY module'],
      ['with-gunzip',            'with-http_gunzip_module',      'Compile with support for gunzip module'],
      ['with-secure-link',       'with-http_secure_link_module', 'Compile with support for secure link module'],
      ['with-status',            'with-http_stub_status_module', 'Compile with support for stub status module'],
      ['with-mp4',               'with-http_mp4_module',         'Compile with support for mp4 module'],
      ['with-realip',            'with-http_realip_module',      'Compile with support for real IP module'],
      ['with-perl',              'with-http_perl_module',        'Compile with support for Perl module'],
      ['with-sub',               'with-http_sub_module',         'Compile with support for HTTP Sub module'],
      ['with-addition',          'with-http_addition_module',    'Compile with support for HTTP Addition module'],
      ['with-degredation',       'with-http_degradation_module', 'Compile with support for HTTP Degredation module'],
      ['with-flv',               'with-http_flv_module',         'Compile with support for FLV module'],
      ['with-geoip',             'with-http_geoip_module',       'Compile with support for GeoIP module'],
      ['with-google-perftools',  'with-google_perftools_module', 'Compile with support for Google Performance tools module'],
      ['with-gzip-static',       'with-http_gzip_static_module', 'Compile with support for Gzip static module'],
      ['with-image-filter',      'with-http_image_filter_module','Compile with support for Image Filter module'],
      ['with-random-index',      'with-http_random_index_module','Compile with support for Random Index module'],
    #  ['with-ssl',               'with-http_ssl_module',         'Compile with support for SSL module'],
      ['with-xslt',              'with-http_xslt_module',        'Compile with support for XSLT module'],
      ['with-pcre-jit',          'with-pcre-jit',                'Compile with support for JIT in PCRE'],
      ['with-auth-req',          'with-http_auth_request_module','Compile with support for HTTP Auth Request Module'],
      ['with-mail',              'with-mail',                    'Compile with support for Mail module']
    ]
  end
  def options
    options = []
    options_array.each do |arr|
      options << ["--#{arr[0]}", arr[2]]
    end
    options
  end

  # Changes default port to 8080
  def patches
    DATA
  end

  def passenger_config_args
    passenger_root = `passenger-config --root`.chomp

    if File.directory?(passenger_root)
      return "--add-module=#{passenger_root}/ext/nginx"
    end

    puts "Unable to install nginx with passenger support. The passenger"
    puts "gem must be installed and passenger-config must be in your path"
    puts "in order to continue."
    exit
  end

  def install
    cc_opt = "-I#{HOMEBREW_PREFIX}/include"
    ld_opt = "-L#{HOMEBREW_PREFIX}/lib"

    if build.with? 'spdy'
      openssl_path = Formula.factory("openssl").opt_prefix
      cc_opt += " -I#{openssl_path}/include"
      ld_opt += " -L#{openssl_path}/lib"
    end

    args = ["--prefix=#{prefix}",
            "--with-http_ssl_module",
            "--with-pcre",
            "--with-ipv6",
            "--sbin-path=#{bin}/nginx",
            "--with-cc-opt=#{cc_opt}",
            "--with-ld-opt=#{ld_opt}",
            "--conf-path=#{etc}/nginx/nginx.conf",
            "--pid-path=#{var}/run/nginx.pid",
            "--lock-path=#{var}/run/nginx.lock",
            "--http-client-body-temp-path=#{var}/run/nginx/client_body_temp",
            "--http-proxy-temp-path=#{var}/run/nginx/proxy_temp",
            "--http-fastcgi-temp-path=#{var}/run/nginx/fastcgi_temp",
            "--http-uwsgi-temp-path=#{var}/run/nginx/uwsgi_temp",
            "--http-scgi-temp-path=#{var}/run/nginx/scgi_temp",
            "--http-log-path=#{var}/log/nginx/access.log",
            "--error-log-path=#{var}/log/nginx/error.log",
            "--with-http_gzip_static_module"
          ]

    # Optional Arguments
    ohai 'Configuring Arguments'
    options_array.each do |arr|
      next unless arr[1]
      ohai "--#{arr[1]}" if build.include? arr[0]
      args << "--#{arr[1]}" if build.include? arr[0]
    end

    # Passenger
    args << passenger_config_args if build.include? 'with-passenger'

    # Install LuaJit
    if build.include? 'with-lua-module'
      ohai "Configuring LuaJit"
      luajit_path = `brew --prefix luajit`.chomp
      ENV['LUAJIT_LIB'] = "#{luajit_path}/lib"
      ENV['LUAJIT_INC'] = "#{luajit_path}/include/luajit-2.0"
      args << "--add-module=#{HOMEBREW_PREFIX}/share/ngx-devel-kit"
      args << "--add-module=#{HOMEBREW_PREFIX}/share/lua-nginx-module"
    end

    # Echo module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/echo-nginx-module" if build.include? 'with-echo-module'

    # Set-Misc module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/set-misc-nginx-module" if build.include? 'with-set-misc-module'

    # Redis2 module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/redis2-nginx-module" if build.include? 'with-redis2-module'

    # Array Var module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/array-var-nginx-module" if build.include? 'with-array-var-module'

    # Accept Language module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/accept-language-nginx-module" if build.include? "with-accept-language"

    # HTTP Access Key module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/accesskey-nginx-module" if build.include? "with-accesskey-module"

    # Auth LDAP Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/auth-ldap-nginx-module" if build.include? "with-auth-ldap"

    # Auth PAM Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/auth-pam-nginx-module" if build.include? "with-auth-pam"

    # Auth Digest Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/auth-digest-nginx-module" if build.include? "with-auth-digest"

    # Cache Purge Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/cache-purge-nginx-module" if build.include? "with-cache-purge"

    # CT++ Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/ctpp2-nginx-module" if build.include? "with-ctpp2-module"

    # Headers More Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/headers-more-nginx-module" if build.include? "with-headers-more-module"

    # HTTP WebDav Ext Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/dav-ext-nginx-module" if build.include? "with-webdav"

    # Eval Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/eval-nginx-module" if build.include? "with-eval-module"

    # Fancy Index Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/fancyindex-nginx-module" if build.include? "with-fancyindex-module"

    # HTTP MogileFS Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/mogilefs-nginx-module" if build.include? "with-mogilefs-module"

    # HTTP MP4/H264 Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/mp4-h264-nginx-module" if build.include? "with-mp4-h264-module"

    # HTTP Notice Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/notice-nginx-module" if build.include? "with-notice-module"

    # Substitutions Filter Module
    args << "--add-module=#{HOMEBREW_PREFIX}/share/subs-filter-nginx-module" if build.include? "with-subs-filter-module"

    if build.head?
      system "./auto/configure", *args
    else
      system "./configure", *args
    end
    system "make"
    system "make install"
    man8.install "objs/nginx.8"
    (var/'run/nginx').mkpath

    # nginx’s docroot is #{prefix}/html, this isn't useful, so we symlink it
    # to #{HOMEBREW_PREFIX}/var/www. The reason we symlink instead of patching
    # is so the user can redirect it easily to something else if they choose.
    prefix.cd do
      dst = HOMEBREW_PREFIX/"var/www"
      if not dst.exist?
        dst.dirname.mkpath
        mv "html", dst
      else
        rm_rf "html"
        dst.mkpath
      end
      Pathname.new("#{prefix}/html").make_relative_symlink(dst)
    end

    # for most of this formula’s life the binary has been placed in sbin
    # and Homebrew used to suggest the user copy the plist for nginx to their
    # ~/Library/LaunchAgents directory. So we need to have a symlink there
    # for such cases
    if (HOMEBREW_CELLAR/'nginx-full').subdirs.any?{|d| (d/:sbin).directory? }
      sbin.mkpath
      sbin.cd do
        (sbin/'nginx').make_relative_symlink(bin/'nginx')
      end
    end
  end

  def caveats; <<-EOS.undent
    Docroot is: #{HOMEBREW_PREFIX}/var/www

    The default port has been set to 8080 so that nginx can run without sudo.

    If you want to host pages on your local machine to the wider network you
    can change the port to 80 in: #{HOMEBREW_PREFIX}/etc/nginx/nginx.conf

    You will then need to run nginx as root: `sudo nginx`.
    EOS
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <false/>
        <key>ProgramArguments</key>
        <array>
            <string>#{opt_prefix}/bin/nginx</string>
            <string>-g</string>
            <string>daemon off;</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end

__END__
--- a/conf/nginx.conf
+++ b/conf/nginx.conf
@@ -33,7 +33,7 @@
     #gzip  on;

     server {
-        listen       80;
+        listen       8080;
         server_name  localhost;

         #charset koi8-r;

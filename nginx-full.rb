require 'formula'

module NginxConstants
  THIRD_PARTY = {
    'lua' => 'Compile with support for LUA module',
    'echo' => 'Compile with support for Echo Module',
    'auth-digest' => 'Compile with support for Auth Digest Module',
    'set-misc' => 'Compile with support for Set Misc Module',
    'redis2' => 'Compile with support for Redis2 Module',
    'array-var' => 'Compile with support for Array Var Module',
    'accept-language' => 'Compile with support for Accept Language Module',
    'accesskey' => 'Compile with support for HTTP Access Key Module',
    'auth-ldap' => 'Compile with support for Auth LDAP Module',
    'auth-pam' => 'Compile with support for Auth PAM Module',
    'cache-purge' => 'Compile with support for Cache Purge Module',
    'ctpp2' => 'Compile with support for CT++ Module',
    'headers-more' => 'Compile with support for Headers More Module',
    'tcp-proxy' => 'Compile with support for TCP proxy',
    'dav-ext' => 'Compile with support for HTTP WebDav Extended Module',
    'eval' => 'Compile with support for Eval Module',
    'fancyindex' => 'Compile with support for Fancy Index Module',
    'mogilefs' => 'Compile with support for HTTP MogileFS Module',
    'mp4-h264' => 'Compile with support for HTTP MP4/H264 Module',
    'notice' => 'Compile with support for HTTP Notice Module',
    'subs-filter' => 'Compile with support for Substitutions Filter Module',
    'upload' => 'Compile with support for Upload module',
    'upload-progress' => 'Compile with support for Upload Progrress module',
    'php-session' => 'Compile with support for Parse PHP Sessions module',
    'anti-ddos' => 'Compile with support for Anti-DDoS module',
    'captcha' => 'Compile with support for Captcha module',
    'autols' => 'Compile with support for Flexible Auto Index module',
    'auto-keepalive' => 'Compile with support for Auto Disable KeepAlive module',
    'ustats' => 'Compile with support for Upstream Statistics (HAProxy style) module',
    'extended-status' => 'Compile with support for Extended Status module',
    'upstream-hash' => 'Compile with support for Upstream Hash Module',
    'consistent-hash' => 'Compile with support for Consistent Hash Upstream module',
    'healthcheck' => 'Compile with support for Healthcheck Module',
    'log-if' => 'Compile with support for Log-if Module',
    'pagespeed' => 'Compile with support for Pagespeed module',
    'txid' => 'Compile with support for Sortable Unique ID',
    'upstream-order' => 'Compile with support for Order Upstream module',
    'var-req-speed' => 'Compile with support for Var Request-Speed module',
    'http-flood-detector' => 'Compile with support for Var Flood-Threshold module',
    'http-remote-passwd' => 'Compile with support for Remote Basic Auth password module',
    'realtime-req' => 'Compile with support for Realtime Request module',
    'counter-zone' => 'Compile with support for Realtime Counter Zone module',
    'mod-zip' => 'Compile with support for HTTP Zip Module',
   }
end

class NginxFull < Formula
  include NginxConstants

  homepage 'http://nginx.org/'
  url 'http://nginx.org/download/nginx-1.4.5.tar.gz'
  sha1 '96c1aecd314f73a3c30a0db8c39ad15ddacb074e'

  devel do
    url 'http://nginx.org/download/nginx-1.5.10.tar.gz'
    sha1 '89e2317c0d27a7386f62c3ba9362ae10b05e3159'
  end

  head 'http://hg.nginx.org/nginx/', :using => :hg

  env :userpaths

  depends_on 'pcre'
  depends_on 'passenger' => :optional
  # SPDY needs openssl >= 1.0.1 for NPN; see:
  # https://tools.ietf.org/agenda/82/slides/tls-3.pdf
  # http://www.openssl.org/news/changelog.html
  depends_on 'openssl' if build.with? 'spdy'
  depends_on 'geoip' if build.with? 'geoip'
  depends_on 'libxml2' if build.with? 'xslt'
  depends_on 'libxslt' if build.with? 'xslt'
  depends_on 'gd' if build.with? 'image-filter'
  depends_on "valgrind" if build.include? 'without-pool-nginx'

  # register third party flags
  THIRD_PARTY.each { | name, desc |
    depends_on "#{name}-nginx-module" if build.include? "with-#{name}-module"
  }

  skip_clean 'logs'

  # Options
  def options_array
    THIRD_PARTY.collect { | name, desc |
      ["with-#{name}-module", nil, desc]
    } + [
      ['with-passenger',         nil,                            'Compile with support for Phusion Passenger module'],
      ['without-pool-nginx',     nil,                            'Disable nginx-pool, valgrind detect memory issues'],
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

  def patches
    # Changes default port to 8080
    patches = {
      :p1 => DATA,
    }

    # replaces nginx's pool machanism
    # with plain malloc & free to help tools like valgrind's memcheck to detect
    # memory issues more reliably.
    if build.include? 'without-pool-nginx'
      patches[:p1] = 'https://raw.github.com/shrimp/no-pool-nginx/master/nginx-1.4.3-no_pool.patch' if build.stable?
      patches[:p1] = 'https://raw.github.com/shrimp/no-pool-nginx/master/nginx-1.5.8-no_pool.patch' if build.devel?
    end

    patches
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
    end

    # add third party flags
    args += THIRD_PARTY.select { | name, desc |
      build.with? "#{name}-module"
    }.collect { | name, desc |
      "--add-module=#{HOMEBREW_PREFIX}/share/#{name}-nginx-module"
    }

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

  test do
    system "#{bin}/nginx", '-t'
  end

  def passenger_caveats; <<-EOS.undent

    To activate Phusion Passenger, add this to #{etc}/nginx/nginx.conf:
      passenger_root #{HOMEBREW_PREFIX}/opt/passenger/libexec/lib/phusion_passenger/locations.ini
      passenger_ruby /usr/bin/ruby
    EOS
  end

  def caveats
    s = <<-EOS.undent
    Docroot is: #{HOMEBREW_PREFIX}/var/www

    The default port has been set in #{HOMEBREW_PREFIX}/etc/nginx/nginx.conf to 8080 so that
    nginx can run without sudo.
    EOS
    s << passenger_caveats if build.include? 'with-passenger'
    s
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

require 'formula'

class NginxFull < Formula

  homepage 'http://nginx.org/'
  url 'http://nginx.org/download/nginx-1.4.2.tar.gz'
  sha1 '8f006dc773840b6624a137a584ff8850d5155e3f'

  devel do
    url 'http://nginx.org/download/nginx-1.5.3.tar.gz'
    sha1 '88f4548e46c25d32f08681c0aba39b86b84ec3a3'
  end

  head 'http://hg.nginx.org/nginx/', :using => :hg

  env :userpaths

  depends_on 'pcre'
  # SPDY needs openssl >= 1.0.1 for NPN; see:
  # https://tools.ietf.org/agenda/82/slides/tls-3.pdf
  # http://www.openssl.org/news/changelog.html
  depends_on 'openssl' if build.with? 'spdy'
  depends_on 'ngx-devel-kit' if build.include? 'with-lua-module'
  depends_on 'lua-nginx-module' if build.include? 'with-lua-module'
  depends_on 'echo-nginx-module' if build.include? 'with-echo-module'
  depends_on 'auth-digest-nginx-module' if build.include? 'with-auth-digest'
  depends_on 'set-misc-nginx-module' if build.include? 'with-set-misc-module'
  depends_on 'redis2-nginx-module' if build.include? 'with-redis2-module'

  skip_clean 'logs'

  # Options
  def options_array
    option_data = [
      ['with-passenger',       nil,                            'Compile with support for Phusion Passenger module'],
      ['with-lua-module',      nil,                            'Compile with support for LUA module'],
      ['with-echo-module',     nil,                            'Compile with support for Echo Module'],
      ['with-auth-digest',     nil,                            'Compile with support for Auth Digest Module'],
      ['with-set-misc-module', nil,                            'Compile with support for Set Misc Module'],
      ['with-redis2-module',   nil,                            'Compile with support for Redis2 Module'],
      ['with-webdav',          'with-http_dav_module',         'Compile with support for WebDAV module'],
      ['with-debug',           'with-debug',                   'Compile with support for debug log'],
      ['with-spdy',            'with-http_spdy_module',        'Compile with support for SPDY module'],
      ['with-gunzip',          'with-http_gunzip_module',      'Compile with support for gunzip module'],
      ['with-secure-link',     'with-http_secure_link_module', 'Compile with support for secure link module'],
      ['with-status',          'with-http_stub_status_module', 'Compile with support for stub status module'],
      ['with-mp4',             'with-http_mp4_module',         'Compile with support for mp4 module'],
      ['with-realip',          'with-http_realip_module',      'Compile with support for real IP module'],
      ['with-perl',            'with-http_perl_module',        'Compile with support for Perl module']
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
      args << "--add-module=/usr/local/share/ngx-devel-kit"
      args << "--add-module=/usr/local/share/lua-nginx-module"
    end

    # Echo module
    args << "--add-module=/usr/local/share/echo-nginx-module" if build.include? 'with-echo-module'

    # Set-Misc module
    args << "--add-module=/usr/local/share/set-misc-nginx-module" if build.include? 'with-set-misc-module'

    # Redis2 module
    args << "--add-module=/usr/local/share/redis2-nginx-module" if build.include? 'with-redis2-module'

    # Auth Digest Module
    args << "--add-module=/usr/local/share/auth-digest-nginx-module" if build.include? "with-auth-digest"

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
    if (HOMEBREW_CELLAR/'nginx').subdirs.any?{|d| (d/:sbin).directory? }
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

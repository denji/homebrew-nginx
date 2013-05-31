require 'formula'

class Nginx15 < Formula

  homepage 'http://nginx.org/'
  url 'http://nginx.org/download/nginx-1.5.0.tar.gz'
  sha1 '4f61368d6a0e340d04d116400616bf3179463df2'

  head 'http://hg.nginx.org/nginx/', :using => :hg

  env :userpaths

  depends_on 'pcre'
  depends_on 'ngx-devel-kit' if build.include? 'with-luajit'
  depends_on 'lua-nginx-module' if build.include? 'with-luajit'

  option 'with-passenger', 'Compile with support for Phusion Passenger module'
  option 'with-webdav', 'Compile with support for WebDAV module'
  option 'with-debug', 'Compile with support for debug log'
  option 'with-spdy', 'Compile with support for SPDY module'
  option 'with-gunzip', 'Compile with support for gunzip module'
  option 'with-secure-link', 'Compile with support for secure link module'
  option 'with-status', 'Compile with support for stub status module'
  option 'with-mp4', 'Compile with support for mp4 module'
  option 'with-realip', 'Compile with support for real IP module'
  option 'with-luajit', 'Compile with support for LUA module'
  option 'with-perl', 'Compile with support for Perl module'

  skip_clean 'logs'

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
    args = ["--prefix=#{prefix}",
            "--with-http_ssl_module",
            "--with-pcre",
            "--with-ipv6",
            "--sbin-path=#{bin}/nginx15",
            "--with-cc-opt=-I#{HOMEBREW_PREFIX}/include",
            "--with-ld-opt=-L#{HOMEBREW_PREFIX}/lib",
            "--conf-path=#{etc}/nginx15/nginx.conf",
            "--pid-path=#{var}/run/nginx15.pid",
            "--lock-path=#{var}/run/ngin15x.lock",
            "--http-client-body-temp-path=#{var}/run/nginx15/client_body_temp",
            "--http-proxy-temp-path=#{var}/run/nginx15/proxy_temp",
            "--http-fastcgi-temp-path=#{var}/run/nginx15/fastcgi_temp",
            "--http-uwsgi-temp-path=#{var}/run/nginx15/uwsgi_temp",
            "--http-scgi-temp-path=#{var}/run/nginx15/scgi_temp",
            "--http-log-path=#{var}/log/nginx15",
            "--with-http_gzip_static_module"
          ]

    args << passenger_config_args if build.include? 'with-passenger'
    args << "--with-http_dav_module" if build.include? 'with-webdav'
    args << "--with-debug" if build.include? 'with-debug'
    args << "--with-http_spdy_module" if build.include? 'with-spdy'
    args << "--with-http_gunzip_module" if build.include? 'with-gunzip'
    args << "--with-http_secure_link_module" if build.include? 'with-secure-link'
    args << "--with-http_stub_status_module" if build.include? 'with-status'
    args << "--with-http_mp4_module" if build.include? 'with-mp4'
    args << "--with-http_realip_module" if build.include? 'with-realip'
    args << "--with-http_perl_module" if build.include? 'with-perl'

    # Install LuaJit
    if build.include? 'with-luajit'
      luajit_path = `brew --prefix luajit`.chomp
      ENV['LUAJIT_LIB'] = "#{luajit_path}/lib"
      ENV['LUAJIT_INC'] = "#{luajit_path}/include/luajit-2.0"
      args << "--add-module=/usr/local/share/ngx-devel-kit"
      args << "--add-module=/usr/local/share/lua-nginx-module"
    end

    if build.head?
      system "./auto/configure", *args
    else
      system "./configure", *args
    end
    (etc/'nginx15').mkpath
    system "make"
    system "make install"
    (var/'run/nginx15').mkpath

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
    if (HOMEBREW_CELLAR/'nginx15').subdirs.any?{|d| (d/:sbin).directory? }
      sbin.mkpath
      sbin.cd do
        (sbin/'nginx15').make_relative_symlink(bin/'nginx15')
      end
    end
  end

  def caveats; <<-EOS.undent
    Docroot is: #{HOMEBREW_PREFIX}/var/www

    The default port has been set to 8085 so that nginx can run without sudo.

    If you want to host pages on your local machine to the wider network you
    can change the port to 80 in: #{HOMEBREW_PREFIX}/etc/nginx15/nginx.conf

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
            <string>#{opt_prefix}/bin/nginx15</string>
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
+        listen       8085;
         server_name  localhost;

         #charset koi8-r;

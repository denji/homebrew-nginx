# homebrew-nginx

Homebrew tap for nginx-full and OpenResty, with a large set of third-party
modules. Two formulas cover the base build; everything else is a separate
module formula you install only if you need it.

## Install

```sh
brew tap denji/nginx
brew install nginx-full
```

If core nginx is already installed:

```sh
brew unlink nginx
brew install nginx-full
brew link nginx-full
```

## Versions

- nginx-full: 1.30.0 (stable) - https://nginx.org/en/download.html
- nginx-full head: mainline via git (1.29.8 or later)
- openresty: 1.25.3.2

## Two ways to add a module

nginx supports two ways to bring in a third-party module. Which one you use
depends on the module.

**Static** - compiled into the nginx binary. Adding or removing a static
module means rebuilding nginx-full.

```sh
brew install lua-nginx-module ngx-devel-kit
brew install nginx-full --with-lua-module
```

**Dynamic** - a standalone `.so` file, loaded at runtime with `load_module`.
No nginx rebuild needed to add, remove, or update it.

```sh
brew install geoip2-nginx-module
```

```nginx
# nginx.conf, before the http block
load_module modules/ngx_http_geoip2_module.so;
```

```sh
nginx -s reload
```

### Why not every module supports both

A module can be a dynamic `.so` only if it is self-contained: it must not
depend on another module's internals at compile time, and it must not patch
nginx's own source. Modules that fail either test are static-only.

Static-only, and why:

| Reason | Modules |
|---|---|
| Needs ngx-devel-kit at compile time | lua, set-misc, array-var, mruby, stream-lua |
| Patches nginx core source | no-pool-nginx, extended-status, ustats, tcp-proxy |
| Patches its own module source for compatibility, kept static for stability | push-stream, notice, mp4-h264 |
| Unmaintained, predates the dynamic module API | mogilefs, ctpp2 |
| Everything else without a listed .so | see the full list below |

Dynamic-capable (formula builds a `.so`; also installs source for the
static path if you prefer `--with-<name>-module` instead):

```
auth-digest  brotli*  cache-purge  dav-ext  echo  fancyindex  geoip2
headers-more  nchan  njs  redis2  rtmp  subs-filter  upload-progress
vod  vts
```

`*` brotli's stable release is missing a bundled dependency in its GitHub
tarball; use `brew install --HEAD brotli-nginx-module` for the `.so`. The
static source path works with either version.

## nginx-full options

```sh
brew options nginx-full
```

### Core modules (static, part of nginx-full itself)

```
--with-addition            --with-passenger
--with-auth-req            --with-pcre-jit
--with-debug                --with-perl
--with-degradation          --with-random-index
--with-flv                  --with-realip
--with-google-perftools     --with-secure-link
--with-gunzip                --with-slice
--with-gzip-static           --with-status
--with-http2                 --with-stream
--with-image-filter          --with-stream-ssl
--with-mail                  --with-stream-ssl-preread
--with-mail-ssl               --with-stream-realip
--with-mp4                    --with-sub
--with-no-pool-nginx          --with-webdav
```

### Third-party modules

Install the module formula, then pass `--with-<name>-module` to nginx-full:

```
accept-language   ajp              array-var        auth-digest
accesskey         anti-ddos        auth-ldap        auth-pam
auto-keepalive    autols           brotli           cache-purge
captcha           counter-zone     ctpp2            dav-ext
dosdetector       echo             eval             extended-status
fancyindex        geoip2           headers-more     healthcheck
http-accounting   http-flood-detector  http-remote-passwd  log-if
lua               mod-zip          mogilefs         mp4-h264
mruby             naxsi            nchan            njs
notice            php-session      push-stream      realtime-req
redis             redis2           rtmp             set-misc
small-light       stream-lua       subs-filter      tarantool
tcp-proxy         txid             unzip            upload
upload-progress   upstream-check   upstream-order   ustats
var-req-speed     vod              vts              websockify
xsltproc
```

Some modules need another module or a flag present first; nginx-full checks
this at build time and stops with a clear message if not:

- dav-ext requires --with-webdav
- http-flood-detector requires --with-status
- stream-lua requires --with-stream
- set-misc, lua, array-var, mruby pull in ngx-devel-kit automatically

## OpenResty options

```sh
brew options openresty
```

| Option | Description |
|---|---|
| --with-debug | debug logging |
| --with-postgresql | ngx_http_postgres_module |
| --with-iconv | ngx_http_iconv_module |
| --with-slice | ngx_http_slice_module |

openresty-debug is the same build with debug logging always on. Only one
of openresty / openresty-debug can be installed at a time.

## Service management

```sh
brew services start   denji/nginx/nginx-full
brew services stop    denji/nginx/nginx-full
brew services restart denji/nginx/nginx-full
```

Manual, foreground:

```sh
nginx -g 'daemon off;'
```

Reload config, reopen logs, graceful stop, immediate stop:

```sh
nginx -s reload
nginx -s reopen
nginx -s quit
nginx -s stop
```

Bind port 80 without running as root:

```sh
sudo chown root:wheel $(brew --prefix)/bin/nginx
sudo chmod u+s $(brew --prefix)/bin/nginx
```

## Paths

| Item | Path |
|---|---|
| Binary | $(brew --prefix)/bin/nginx |
| Config | $(brew --prefix)/etc/nginx/nginx.conf |
| Server includes | $(brew --prefix)/etc/nginx/servers/ |
| Docroot | $(brew --prefix)/var/www |
| Access log | $(brew --prefix)/var/log/nginx/access.log |
| Error log | $(brew --prefix)/var/log/nginx/error.log |
| Dynamic modules | $(brew --prefix)/lib/nginx/modules/ |
| Default port | 8080 (no root required) |

## Examples

Static Lua build:

```sh
brew install ngx-devel-kit lua-nginx-module
brew install nginx-full --with-lua-module --with-status --with-realip
```

Dynamic GeoIP2 and Brotli, no nginx-full rebuild:

```sh
brew install geoip2-nginx-module
brew install --HEAD brotli-nginx-module
```

```nginx
load_module modules/ngx_http_geoip2_module.so;
load_module modules/ngx_http_brotli_filter_module.so;
load_module modules/ngx_http_brotli_static_module.so;
```

Mixed: WebDAV core module plus static dav-ext plus dynamic geoip2:

```sh
brew install dav-ext-nginx-module geoip2-nginx-module
brew install nginx-full --with-webdav --with-dav-ext-module
```

## Contributing

1. Fork the repository.
2. Add or edit a formula in Formula/. Use a similar existing formula as a
   guide - static-only modules use pkgshare.install Dir["*"]; dynamic-
   capable modules add a resource "nginx" block and build with
   --add-dynamic-module.
3. Test: brew install --build-from-source ./Formula/<name>.rb
4. Check: brew audit --strict ./Formula/<name>.rb && brew style ./Formula/<name>.rb
5. Open a pull request.

### Bumping a module version

```sh
brew bump-formula-pr denji/nginx/<name>-nginx-module \
  --url=<new-url> --sha256=<new-sha256>
```

### Adding a new module

1. Create Formula/<name>-nginx-module.rb.
2. If the module can be dynamic, follow geoip2-nginx-module.rb as a
   template. If it needs ngx-devel-kit or patches nginx core, follow
   set-misc-nginx-module.rb (static only).
3. Add the entry to the third_party_modules table in nginx-full.rb so
   the static path works too.
4. Open a pull request.

## References

- nginx docs: https://nginx.org/en/docs/
- nginx downloads: https://nginx.org/en/download.html
- OpenResty: https://openresty.org/en/download.html
- Homebrew Formula Cookbook: https://docs.brew.sh/Formula-Cookbook
- Homebrew tap guide: https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

require 'formula'

class NoPoolNginx < Formula
  homepage 'https://github.com/shrimp/no-pool-nginx'
  version '0.1'

  depends_on "valgrind"

  # replaces nginx's pool machanism
  # with plain malloc & free to help tools like valgrind's memcheck to detect
  # memory issues more reliably.
  def patches
    "https://raw.github.com/shrimp/no-pool-nginx/master/nginx-1.5.8-no_pool.patch"
  end
end

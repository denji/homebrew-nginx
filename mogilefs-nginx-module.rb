require "formula"

class MogilefsNginxModule < Formula
  homepage "http://www.grid.net.ru/nginx/mogilefs.en.html"
  url "http://www.grid.net.ru/nginx/download/nginx_mogilefs_module-1.0.4.tar.gz"
  sha1 "4f6b774096a77aa8c550d8fd6a3f5d39a661d8ed"

  def install
    (share+"mogilefs-nginx-module").install Dir["*"]
  end
end

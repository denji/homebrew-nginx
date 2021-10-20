class MogilefsNginxModule < Formula
  desc "MogileFS client for nginx web server"
  homepage "http://www.grid.net.ru/nginx/mogilefs.en.html"
  url "http://www.grid.net.ru/nginx/download/nginx_mogilefs_module-1.0.4.tar.gz"
  sha256 "7ac230d30907f013dff8d435a118619ea6168aa3714dba62c6962d350c6295ae"
  head "https://github.com/vkholodkov/nginx-mogilefs-module.git"

  def install
    pkgshare.install Dir["*"]
  end
end

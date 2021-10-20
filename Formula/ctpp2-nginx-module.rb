class Ctpp2NginxModule < Formula
  desc "Embeds virtual template engine CT++ in the nginx"
  homepage "http://ngx-ctpp.vbart.ru/"
  url "http://dl.vbart.ru/ngx-ctpp/ngx_ctpp2-0.5.tar.gz"
  sha256 "f8adfecc23e2c23af95df8549ef92fd52598b21506a9d9df2278b2605668d5a6"
  head "svn://svn.vbart.ru/ngx_ctpp2/trunk"

  def install
    pkgshare.install Dir["*"]
  end
end

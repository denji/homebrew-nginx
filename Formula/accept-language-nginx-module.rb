class AcceptLanguageNginxModule < Formula
  desc "Parse the Accept-Language header and set variable"
  homepage "https://github.com/giom/nginx_accept_language_module"
  url "https://github.com/giom/nginx_accept_language_module/tarball/master/giom-nginx_accept_language_module-2f69842.tar.gz"
  sha256 "fbcdf792160a1eff7b9549aeb5209d6e76716ff8e86b05e42c90b2d2f858e011"

  def install
    pkgshare.install Dir["*"]
  end
end

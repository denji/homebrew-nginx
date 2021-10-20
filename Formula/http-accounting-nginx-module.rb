class HttpAccountingNginxModule < Formula
  desc "Add traffic stat function to nginx"
  homepage "https://github.com/Lax/ngx_http_accounting_module"
  url "https://github.com/Lax/ngx_http_accounting_module/archive/v0.5.tar.gz"
  sha256 "f14b8e23b137eebe9e56e84be831c3db3e042b3294a1d99f1ad9d2715e5383f9"

  def install
    pkgshare.install Dir["*"]
  end
end

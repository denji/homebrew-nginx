class HttpAccountingNginxModule < Formula
  desc "Add traffic stat function to nginx"
  homepage "https://github.com/Lax/ngx_http_accounting_module"
  url "https://github.com/Lax/ngx_http_accounting_module/archive/v2.0.tar.gz"
  sha256 "8c99c5313e5c822aa5683691c8a0641499b2fa8c67f9e55652817042e21f5986"

  def install
    pkgshare.install Dir["*"]
  end
end

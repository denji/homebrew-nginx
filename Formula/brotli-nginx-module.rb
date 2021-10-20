class BrotliNginxModule < Formula
  desc "NGINX module for Brotli compression"
  homepage "https://github.com/eustas/ngx_brotli"
  url "https://github.com/eustas/ngx_brotli/archive/v0.1.2.tar.gz"
  sha256 "309af9e96c10e80f1884acea96379980979581adc287ce338f084607bd48c185"
  head "https://github.com/eustas/ngx_brotli.git"

  def install
    pkgshare.install Dir["*"]
  end
end

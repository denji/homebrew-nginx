require "formula"

class EvalNginxModule < Formula
  homepage "https://github.com/vkholodkov/nginx-eval-module"
  url "https://github.com/vkholodkov/nginx-eval-module/archive/1.0.3.tar.gz"
  sha1 "16df14c6c56a9965eee97f74df2933be2463535b"

  def install
    (share+"eval-nginx-module").install Dir["*"]
  end
end

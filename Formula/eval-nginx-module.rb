class EvalNginxModule < Formula
  desc "Evaluate memcached/proxy response into vars"
  homepage "https://github.com/vkholodkov/nginx-eval-module"
  url "https://github.com/vkholodkov/nginx-eval-module/archive/1.0.4.tar.gz"
  sha256 "0042fcfc677e4dab8d5627a46e4818e9c0c93b0aaa26d24ab8a37c9471de06a6"

  def install
    pkgshare.install Dir["*"]
  end
end

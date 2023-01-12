class TarantoolNginxModule < Formula
  desc "Tarantool upstream for nginx"
  homepage "https://github.com/tarantool/nginx_upstream_module"
  url "https://github.com/tarantool/nginx_upstream_module/archive/v2.7.1.tar.gz"
  sha256 "546505e2cedba4d4b870911f763520a34d33e5d9c045e388e12c7de81cdb48eb"

  depends_on "cmake" => :build
  depends_on "msgpuck" => :build
  depends_on "yajl"

  def install
    pkgshare.install Dir["*"]
  end
end

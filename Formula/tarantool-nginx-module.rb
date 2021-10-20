class TarantoolNginxModule < Formula
  desc "Tarantool upstream for nginx"
  homepage "https://github.com/tarantool/nginx_upstream_module"
  url "https://github.com/tarantool/nginx_upstream_module/archive/v2.7.tar.gz"
  version "2.7"
  sha256 "48d0bd45de57c9c34c836941d79ac53b3d51d715361d447794aecd5e16eacfea"

  depends_on "msgpuck" => :build
  depends_on "cmake" => :build
  depends_on "yajl"

  def install
    pkgshare.install Dir["*"]
  end
end

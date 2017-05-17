class TarantoolNginxModule < Formula
  desc "Tarantool upstream for nginx"
  homepage "https://github.com/tarantool/nginx_upstream_module"
  url "https://github.com/tarantool/nginx_upstream_module/archive/v2.5-stable.tar.gz"
  version "2.5"
  sha256 "f425c430ec3d9b8ede57d985f731b4162edaf945683f6bf46b6656ed2a0432e3"

  bottle :unneeded

  depends_on "msgpuck" => :build
  depends_on "cmake" => :build
  depends_on "yajl"

  def install
    pkgshare.install Dir["*"]
  end
end

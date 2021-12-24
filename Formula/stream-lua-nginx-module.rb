class StreamLuaNginxModule < Formula
  desc "Embed the power of Lua into NGINX stream/TCP servers"
  homepage "https://github.com/openresty/stream-lua-nginx-module"
  head "https://github.com/openresty/stream-lua-nginx-module.git", branch: "master"

  depends_on "autoconf" => :build

  def install
    pkgshare.install Dir["*"]
  end
end

class StreamLuaNginxModule < Formula
  desc "Embed the power of Lua into NGINX stream/TCP servers"
  homepage "https://github.com/openresty/stream-lua-nginx-module"

  head do
    url "https://github.com/openresty/stream-lua-nginx-module.git"
    depends_on "autoconf" => :build
  end

  def install
    pkgshare.install Dir["*"]
  end
end

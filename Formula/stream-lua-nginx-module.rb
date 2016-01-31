class StreamLuaNginxModule < Formula
  desc "Embed the power of Lua into NGINX stream/TCP servers"
  homepage "https://github.com/openresty/stream-lua-nginx-module"

  head do
    url "https://github.com/openresty/stream-lua-nginx-module.git"
    depends_on "autoconf" => :build
  end

  bottle :unneeded

  def install
    (share/"stream-lua-nginx-module").install Dir["*"]
  end
end

class NgxDevelKit < Formula
  desc "Nginx Development Kit"
  homepage "https://github.com/simpl/ngx_devel_kit"
  url "https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz"
  sha256 "501f299abdb81b992a980bda182e5de5a4b2b3e275fbf72ee34dd7ae84c4b679"
  head "https://github.com/simpl/ngx_devel_kit.git"

  bottle :unneeded

  def install
    (share+"ngx-devel-kit").install Dir["*"]
  end
end

require "formula"

class NgxDevelKit < Formula
  homepage "https://github.com/simpl/ngx_devel_kit"
  url "https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz"
  sha1 "888635e80a8a0e6242b8e9b684ff60ffa70845a2"

  def install
    (share+"ngx-devel-kit").install Dir["*"]
  end
end

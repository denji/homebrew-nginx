class NgxDevelKit < Formula
  desc "Nginx Development Kit"
  homepage "https://github.com/simpl/ngx_devel_kit"
  url "https://github.com/simpl/ngx_devel_kit/archive/v0.3.0rc1.tar.gz"
  sha256 "971207aad81244ea60541574776eb9b8e74606bd57f4e6508cbd7926809d9e75"
  head "https://github.com/simpl/ngx_devel_kit.git"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

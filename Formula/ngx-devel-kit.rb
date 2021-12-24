class NgxDevelKit < Formula
  desc "Nginx Development Kit"
  homepage "https://github.com/simpl/ngx_devel_kit"
  url "https://github.com/simpl/ngx_devel_kit/archive/v0.3.1.tar.gz"
  sha256 "0e971105e210d272a497567fa2e2c256f4e39b845a5ba80d373e26ba1abfbd85"
  head "https://github.com/simpl/ngx_devel_kit.git"

  def install
    pkgshare.install Dir["*"]
  end
end

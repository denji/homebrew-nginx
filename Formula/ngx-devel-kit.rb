class NgxDevelKit < Formula
  desc "Nginx Development Kit"
  homepage "https://github.com/simpl/ngx_devel_kit"
  url "https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz"
  sha256 "88e05a99a8a7419066f5ae75966fb1efc409bad4522d14986da074554ae61619"
  head "https://github.com/simpl/ngx_devel_kit.git"

  def install
    pkgshare.install Dir["*"]
  end
end

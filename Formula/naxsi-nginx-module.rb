class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.55.tar.gz"
  sha256 "144f651d8d7fb17b6dbde703070202a5479238718e1f61c26f24fc29423b98fa"
  version_scheme 1
  head "https://github.com/nbs-system/naxsi.git"

  bottle :unneeded

  def install
    cd "naxsi_src" do
      pkgshare.install Dir["*"]
    end

    cd "naxsi_config" do
      (etc+"nginx").install Dir["*"]
    end
  end

  test do
    File.exist?pkgshare
    File.exist?(etc/"nginx/naxsi_core.rules")
  end
end

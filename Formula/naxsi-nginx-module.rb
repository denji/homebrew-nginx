class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.55.3.tar.gz"
  sha256 "0b3c95d250772dc89ad8b49e47c1e024c5ae2c76c0cffa445e9fe05c4dd13495"
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

class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.55.2.tar.gz"
  sha256 "256378564e36b8f222adb8fbe746529e73413c6cbe2b0e5574f41dfd62d92577"
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

class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/1.3.tar.gz"
  sha256 "439c8677372d2597b4360bbcc10bc86490de1fc75695b193ad5df154a214d628"
  head "https://github.com/nbs-system/naxsi.git", branch: "master"

  def install
    cd "naxsi_src" do
      pkgshare.install Dir["*"]
    end

    cd "naxsi_config" do
      (etc+"nginx").install Dir["*"]
    end
  end

  test do
    File.exist? pkgshare
    File.exist?(etc/"nginx/naxsi_core.rules")
  end
end

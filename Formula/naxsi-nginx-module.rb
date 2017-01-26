class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.55.1.tar.gz"
  sha256 "45dd0df7a6b0b6aa9c64eb8c39a8e294d659d87fb18e192cf58f1402f3cdb0a8"
  #version_scheme 1
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

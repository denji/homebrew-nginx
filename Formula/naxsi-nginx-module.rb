class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.55rc2.tar.gz"
  sha256 "fed822e3f507801ce44964908eb1dca8ec58dc0a9bc47f7e7d00c6c4ef97f78b"
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

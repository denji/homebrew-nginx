class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.54.tar.gz"
  sha256 "9cc2c09405bc71f78ef26a8b6d70afcea3fccbe8125df70cb0cfc480133daba5"
  head "https://github.com/nbs-system/naxsi.git"

  def install
    cd "naxsi_src" do
      (share+"naxsi-nginx-module").install Dir["*"]
    end

    cd "naxsi_config" do
      (etc+"nginx").install Dir["*"]
    end
  end

  test do
    File.exist?(share/"naxsi-nginx-module/config")
    File.exist?(etc/"nginx/naxsi_core.rules")
  end
end

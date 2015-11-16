class NaxsiNginxModule < Formula
  desc "NAXSI is an open-source, high performance, low rules maintenance WAF for NGINX"
  homepage "https://github.com/nbs-system/naxsi"
  url "https://github.com/nbs-system/naxsi/archive/0.54.tar.gz"
  sha1 "d5db25db19a564358af7763d4935e978d05bf6f5"
  head "https://github.com/nbs-system/naxsi.git"

  def install
    cd "naxsi_src" do
      (share+"naxsi-nginx-module").install Dir["*"]
    end

    cd "naxsi_config" do
      (etc+"nginx").install Dir["*"]
    end
  end
end

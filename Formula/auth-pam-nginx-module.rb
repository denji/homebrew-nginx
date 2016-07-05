class AuthPamNginxModule < Formula
  desc "PAM for http basic authentication for nginx"
  homepage "https://github.com/stogh/ngx_http_auth_pam_module"
  url "https://github.com/stogh/ngx_http_auth_pam_module/archive/v1.4.tar.gz"
  sha256 "095742c5bcb86f2431e215db785bdeb238d594f085a0ac00d16125876a157409"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

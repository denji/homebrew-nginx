class AuthPamNginxModule < Formula
  desc "PAM for http basic authentication for nginx"
  homepage "https://github.com/stogh/ngx_http_auth_pam_module"
  url "https://github.com/stogh/ngx_http_auth_pam_module/archive/v1.5.1.tar.gz"
  sha256 "77676842919134af88a7b4bfca4470223e3a00d287d17c0dbdc9a114a685b6e7"

  def install
    pkgshare.install Dir["*"]
  end
end

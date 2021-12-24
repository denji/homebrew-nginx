class AuthPamNginxModule < Formula
  desc "PAM for http basic authentication for nginx"
  homepage "https://github.com/stogh/ngx_http_auth_pam_module"
  url "https://github.com/stogh/ngx_http_auth_pam_module/archive/v1.5.3.tar.gz"
  sha256 "882018fea8d6955ab3fe294aafa8ebb1fdff4eac313c29583fef02c6de76fae7"

  def install
    pkgshare.install Dir["*"]
  end
end

class UploadNginxModule < Formula
  desc "file uploads using multipart/form-data encoding (RFC 1867)"
  homepage "http://wiki.nginx.org/HttpUploadModule"
  url "https://github.com/vkholodkov/nginx-upload-module/archive/57bbb0db23f113f2a8fa2d09d9193927b891fa75.zip"
  version "2.255.2"
  sha256 "8786f14d3274a122c0bb72c39431df8bc260e603228182b3c8a5731055ac8da0"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

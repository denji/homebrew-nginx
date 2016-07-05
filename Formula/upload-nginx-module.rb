class UploadNginxModule < Formula
  desc "file uploads using multipart/form-data encoding (RFC 1867)"
  homepage "http://wiki.nginx.org/HttpUploadModule"
  url "https://github.com/vkholodkov/nginx-upload-module/archive/2.2.tar.gz"
  version "2.2.0"
  sha256 "036f9fe82bfaef56ee24849d8343712ac3789a45e563f01337a4a6946f968259"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

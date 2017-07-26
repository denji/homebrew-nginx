class UploadNginxModule < Formula
  desc "file uploads using multipart/form-data encoding (RFC 1867)"
  homepage "http://wiki.nginx.org/HttpUploadModule"
  url "https://github.com/vkholodkov/nginx-upload-module/archive/70bee48.tar.gz"
  version "2.255.1"
  sha256 "5f1c3c2b9858b9cacd877a0f2df9b9263734e9cef8d837b73f0e659c0f7fde2d"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

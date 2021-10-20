class UploadNginxModule < Formula
  desc "file uploads using multipart/form-data encoding (RFC 1867)"
  homepage "http://wiki.nginx.org/HttpUploadModule"
  url "https://github.com/fdintino/nginx-upload-module/archive/2.3.0.tar.gz"
  version "2.3.0"
  sha256 "c86e318addb9c88d70fdbd58ff1f6ef6f404a93070f6db8017a1f880c97946c4"

  def install
    pkgshare.install Dir["*"]
  end
end

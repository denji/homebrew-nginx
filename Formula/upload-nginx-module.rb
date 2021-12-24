class UploadNginxModule < Formula
  desc "File uploads using multipart/form-data encoding (RFC 1867)"
  homepage "https://www.nginx.com/resources/wiki/modules/upload/"
  url "https://github.com/fdintino/nginx-upload-module/archive/2.3.0.tar.gz"
  sha256 "c86e318addb9c88d70fdbd58ff1f6ef6f404a93070f6db8017a1f880c97946c4"

  def install
    pkgshare.install Dir["*"]
  end
end

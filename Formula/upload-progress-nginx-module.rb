class UploadProgressNginxModule < Formula
  desc "implementing an upload progress for nginx"
  homepage "http://wiki.nginx.org/HttpUploadProgressModule"
  url "https://github.com/masterzen/nginx-upload-progress-module/archive/v0.9.2.tar.gz"
  sha256 "b286689355442657650421d8e8398bd4abf9dbbaade65947bb0cb74a349cc497"
  head "https://github.com/masterzen/nginx-upload-progress-module.git"

  def install
    pkgshare.install Dir["*"]
  end
end

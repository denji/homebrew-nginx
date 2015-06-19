class UploadProgressNginxModule < Formula
  desc "implementing an upload progress for nginx"
  homepage "http://wiki.nginx.org/HttpUploadProgressModule"
  url "https://github.com/masterzen/nginx-upload-progress-module/archive/v0.9.1.tar.gz"
  sha256 "99ec072cca35cd7791e77c40a8ded41a7a8c1111e057be26e55fba2fdf105f43"
  head "https://github.com/masterzen/nginx-upload-progress-module.git"

  def install
    (share+"upload-progress-nginx-module").install Dir["*"]
  end
end

require "formula"

class UploadNginxModule < Formula
  homepage "http://wiki.nginx.org/HttpUploadModule"
  url "https://github.com/vkholodkov/nginx-upload-module/archive/2.2.tar.gz"
  sha1 "d25e781ff60237cfdbb3f011d159397f82ab7358"
  version "2.2.0"

  def install
    (share+"upload-nginx-module").install Dir["*"]
  end
end

class ModZipNginxModule < Formula
  desc "ZIP archiver for nginx"
  homepage "https://github.com/evanmiller/mod_zip"
  url "https://github.com/evanmiller/mod_zip/archive/255cf540ac53865df93e022bb8c20f1a1e9a54da.zip"
  version "0.2"
  sha256 "48f7803dfe6da9465a5101871ceee584402d055fe1e9c6ecff48cb20d4e9d836"

  def install
    pkgshare.install Dir["*"]
  end
end

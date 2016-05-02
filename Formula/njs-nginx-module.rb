class NjsNginxModule < Formula
  desc "Nginx NJS module"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/master.zip"
  version "1.0"
  #Note that the njs github repo is an automatic sync from a mercurial repo
  sha256 "3077b2c79a79537007213ca1f23ce5f94f51520bfe267f9b7f8127c8b823b722"

  bottle :unneeded

  def install
    (share+"njs-nginx-module").install Dir["nginx/*"]
  end

end

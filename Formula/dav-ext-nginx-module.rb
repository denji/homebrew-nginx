class DavExtNginxModule < Formula
  desc "WebDAV missing commands support PROPFIND and OPTIONS"
  homepage "https://github.com/arut/nginx-dav-ext-module"
  url "https://github.com/arut/nginx-dav-ext-module/archive/v0.1.0.tar.gz"
  sha256 "6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a"

  bottle :unneeded

  def install
    pkgshare.install Dir["*"]
  end
end

require 'formula'

class SetMiscNginxModule < Formula

  homepage 'https://github.com/agentzh/set-misc-nginx-module'
  url 'https://github.com/agentzh/set-misc-nginx-module/archive/v0.22rc8.tar.gz'
  sha1 '5754e2c26af8fbf12949dcdd68d8c916a3da8450'

  def install
    (share+'set-misc-nginx-module').install Dir['*']
  end

end

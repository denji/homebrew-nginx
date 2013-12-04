require 'formula'

class ArrayVarNginxModule < Formula

  homepage 'https://github.com/agentzh/array-var-nginx-module'
  url 'https://github.com/agentzh/array-var-nginx-module/archive/46767472df.tar.gz'
  sha1 '96d8c9fa4d20bd9e0043a76f055d23724fc79dfd'

  def install
    (share+'array-var-nginx-module').install Dir['*']
  end

end

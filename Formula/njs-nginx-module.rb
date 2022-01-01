class NjsNginxModule < Formula
  desc "Adds support for njs scripting to nginx"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.7.1.tar.gz"
  sha256 "f5493b444ef54f1edba85c7adcbb1132e61c36d47de8f7a8d351965cad6d5486"
  head "https://github.com/nginx/njs.git", branch: "master"

  depends_on "pcre" => :build
  depends_on "readline" => :build

  def install
    # First, configure and install the njs command-line binary
    system "./configure"
    system "make", "njs"
    bin.install "build/njs"

    # Then, copy the rest of the module code over to the share to be used by
    # the `nginx-full` formula.
    pkgshare.install Dir["*"]
  end

  test do
    system "njs", "-v"
  end
end

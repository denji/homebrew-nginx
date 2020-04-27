class NjsNginxModule < Formula
  desc "Adds support for njs scripting to nginx"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.3.9.tar.gz"
  sha256 "429f34c5e02a56dd6a8666aa3192288d8693c9cfcde8406390381fa85acf9b28"
  head "https://github.com/nginx/njs.git"

  bottle :unneeded

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

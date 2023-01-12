class NjsNginxModule < Formula
  desc "Adds support for njs scripting to nginx"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.7.9.tar.gz"
  sha256 "92cc425d0b0952bb7e2e7a396cba58feb4a90fb3cb63441c201ab4d3e0cd6403"
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

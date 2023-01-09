class NjsNginxModule < Formula
  desc "Adds support for njs scripting to nginx"
  homepage "https://github.com/nginx/njs"
  url "https://github.com/nginx/njs/archive/0.7.7.tar.gz"
  sha256 "f9e5b6ee79711ef2fcea6482144c0c901b99ba6bd52d72c1c0ae7415a42f4f45"
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

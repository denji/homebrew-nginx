class HttpFloodDetectorNginxModule < Formula
  desc "Detect flood"
  homepage "https://github.com/suehiro/ngx_http_flood_detector_module"
  url "https://github.com/suehiro/ngx_http_flood_detector_module/archive/b66fb66c23.tar.gz"
  version "0.1"
  sha256 "d069eaf0a23d94da6e76d96db2242a731252a258b79b95e6b70bf757b3f125e4"

  def install
    pkgshare.install Dir["*"]
  end
end

# Homebrew formula for DIATraceExtractor 0.2.9: installs the binary release (the tool, the OpenMS and
# vcpkg libraries it links, OpenMS's shared data) under the keg and links the launcher into bin.
class Diatraceextractor < Formula
  desc "DIA fragment and MS1 isotope trace extraction from predicted spectral libraries (OpenMS TOPP tool)"
  homepage "https://github.com/okohlbacher/dia-trace-extract-prototype"
  url "https://github.com/okohlbacher/dia-trace-extract-prototype/releases/download/V0.2.9/DIATraceExtractor-0.2.9-macos-arm64.tar.gz"
  sha256 "1319601fda225bb71a4ac6a86d3ff792ac503a85d08175c20b52e2c68d60a66a"
  version "0.2.9"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/DIATraceExtractor"
  end

  test do
    assert_match "Version: 0.2.9", shell_output("#{bin}/DIATraceExtractor --help 2>&1")
  end
end

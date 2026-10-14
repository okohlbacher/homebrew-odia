# Homebrew formula for DIATraceExtractor 0.2.14: installs the binary release (the tool, the OpenMS and
# vcpkg libraries it links, OpenMS's shared data) under the keg and links the launcher into bin.
class Diatraceextractor < Formula
  desc "DIA fragment and MS1 isotope trace extraction from predicted spectral libraries (OpenMS TOPP tool)"
  homepage "https://github.com/okohlbacher/dia-trace-extract-prototype"
  url "https://github.com/okohlbacher/dia-trace-extract-prototype/releases/download/V0.2.14/DIATraceExtractor-0.2.14-macos-arm64.tar.gz"
  sha256 "af248cee741e6dd510f2e20e936877b011dc74423959596d9fefa726942cd07f"
  version "0.2.14"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/DIATraceExtractor"
  end

  test do
    assert_match "Version: 0.2.14", shell_output("#{bin}/DIATraceExtractor --help 2>&1")
  end
end

# Homebrew formula for DIATraceExtractor 0.2.10: installs the binary release (the tool, the OpenMS and
# vcpkg libraries it links, OpenMS's shared data) under the keg and links the launcher into bin.
class Diatraceextractor < Formula
  desc "DIA fragment and MS1 isotope trace extraction from predicted spectral libraries (OpenMS TOPP tool)"
  homepage "https://github.com/okohlbacher/dia-trace-extract-prototype"
  url "https://github.com/okohlbacher/dia-trace-extract-prototype/releases/download/V0.2.10/DIATraceExtractor-0.2.10-macos-arm64.tar.gz"
  sha256 "fcb94b009dbfbc0e05925db25db220982f8912c2ab96eaf28a290b21f30b9c55"
  version "0.2.10"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"bin/DIATraceExtractor"
  end

  test do
    assert_match "Version: 0.2.10", shell_output("#{bin}/DIATraceExtractor --help 2>&1")
  end
end

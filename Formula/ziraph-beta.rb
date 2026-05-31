  # Ziraph Homebrew formula — BETA channel.
  #   brew tap ziraph/tap
  #   brew install ziraph-beta
  # `ziraph` (stable) will be a separate formula added when stable ships;
  # this file keeps its name forever. PLACEHOLDER url/sha/version until first beta cut.
  # sha source of truth: curl -sSL https://ziraph.com/downloads/beta/manifest.json → "sha256"
  class ZiraphBeta < Formula
    desc "Honest local AI profiling for Apple Silicon — ANE/GPU/CPU power and energy per token (beta)"
    homepage "https://ziraph.com"
    url "https://ziraph.com/downloads/beta/ziraph-beta-latest-macos-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000" # TODO(first-beta-cut)
    version "0.1.0-beta" # TODO(first-beta-cut)
    conflicts_with "ziraph", because: "both install the ziraph binary"
    bottle :unneeded

    def install
      bin.install "ziraph"
    end

    test do
      assert_match "ziraph", shell_output("#{bin}/ziraph --version")
    end
  end

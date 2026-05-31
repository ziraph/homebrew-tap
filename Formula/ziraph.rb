  # Ziraph Homebrew formula — interim: `ziraph` points at the BETA channel
  # until a stable release exists, then `ziraph`→stable + add ziraph-beta.rb.
  # Maintained from packaging/homebrew/ in the ziraph source repo.
  #
  #   brew tap ziraph/tap
  #   brew install ziraph
  #
  # PLACEHOLDER url/sha/version — finalized at the first beta cut.
  # sha source of truth: curl -sSL https://ziraph.com/downloads/beta/manifest.json → "sha256"
  class Ziraph < Formula
    desc "Honest local AI profiling for Apple Silicon — ANE/GPU/CPU power and energy per token"
    homepage "https://ziraph.com"
    url "https://ziraph.com/downloads/beta/ziraph-beta-latest-macos-arm64.tar.gz"
    # TODO(first-beta-cut): replace with the real digest from beta/manifest.json
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    version "0.1.0-beta" # TODO(first-beta-cut): set to the cut's beta version
    bottle :unneeded

    def install
      bin.install "ziraph"
    end

    test do
      assert_match "ziraph", shell_output("#{bin}/ziraph --version")
    end
  end

# Ziraph Homebrew formula — beta channel
#
# This formula pulls the current beta tarball from ziraph.com. It lives in
# the ziraph/homebrew-tap tap and installs via:
#
#   brew tap ziraph/tap
#   brew install ziraph-beta
#
# The sha256 and version fields must be refreshed on every beta release.
# Source of truth for sha256:
#   curl -sSL https://ziraph.com/downloads/beta/ziraph-beta-latest-macos-arm64.tar.gz.sha256
#   # Take the first whitespace-delimited field.
#
# Source of truth for version:
#   curl -sSL https://ziraph.com/downloads/beta/manifest.json
#   # → "version": "<tag>"
#
# Dev is intentionally NOT on the tap. See internal-docs/design/2026-05-31-beta-release-channel.md.

class ZiraphBeta < Formula
  desc "Honest local AI profiler for Apple Silicon — ANE/GPU/CPU power and energy/token"
  homepage "https://ziraph.com"
  url "https://ziraph.com/downloads/beta/ziraph-beta-latest-macos-arm64.tar.gz"
  # Bump this version on every beta release.
  # Source of truth: https://ziraph.com/downloads/beta/manifest.json
  version "v0.1.0-beta.20260612090302"
  # Bump this sha256 on every beta release.
  # Filled at first-beta-cut from:
  #   https://ziraph.com/downloads/beta/ziraph-beta-latest-macos-arm64.tar.gz.sha256
  sha256 "9980807965579a2f715d8a2da390b3de8ab833f2fd93e071137fbf75c41dc48e"

  def install
    # The tarball contains a binary named "ziraph"; rename it on install so
    # both channels can coexist on PATH without conflict.
    bin.install "ziraph" => "ziraph-beta"
    # NOTE: install-time completion generation is intentionally omitted — the beta
    # license gate blocks `ziraph-beta completions` (every verb except `license
    # install`), so generate_completions_from_executable would exit 1 and fail the
    # install. Re-add once the gate exempts completions/--version/--help; until
    # then, run `ziraph-beta completions zsh|bash` manually after installing a key.
  end

  test do
    # Smoke: version flag exits 0 and prints a recognisable string.
    assert_match "ziraph", shell_output("#{bin}/ziraph-beta --version")
  end
end

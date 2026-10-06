# typed: strict
# frozen_string_literal: true

cask "auracle" do
  version "1.2.0,1758"
  sha256 "fc3f4d46311a2e9495e49bb458c4d1d44e266a476e46465e12d7f87ac157f38f"

  url "https://github.com/auracarehq/homebrew-tap/releases/download/mac-v#{version.csv.first}-#{version.csv.second}/Auracle.dmg"
  name "Auracle."
  desc "Personal wellness agent with private local-data connectors"
  homepage "https://auracle.health/"

  auto_updates true
  # The bare symbol, not the comparison-string form. For a cask a symbol already
  # means "this version or newer" — brew info renders it as macOS >= 14 either
  # way — but RuboCop's Homebrew/OSDependsOn rejects the string, and brew style
  # is a hard gate in the publish job. The string sat here unnoticed because that
  # job runs only on publish=true, which nothing used until 0.1.3.
  # Apple silicon only since 2026-09-28: a clear refusal on Intel rather than
  # an app that will not launch.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Auracle.app"

  caveats <<~EOS
    Auracle needs Full Disk Access to import your locally synchronized Messages database.
    Open Auracle and follow Sources → iMessage after installation.
  EOS
end

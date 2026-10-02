# typed: strict
# frozen_string_literal: true

cask "auracle" do
  version "1.2.0,1666"
  sha256 "9f760ed12e9c181bcb768df4dd54e805991b677ffc9c09182bb08a007955319b"

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

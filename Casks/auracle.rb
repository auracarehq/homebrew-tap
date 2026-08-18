# typed: strict
# frozen_string_literal: true

cask "auracle" do
  version "0.1.4.166"
  sha256 "893d3434a39f01aa985799b2f5561751b79016ef781793091a2409100688f6dc"

  url "https://github.com/auracarehq/homebrew-tap/releases/download/mac-v#{version}/Auracle.dmg"
  name "Auracle."
  desc "Personal wellness twin with private local-data connectors"
  homepage "https://auracle.health/"

  auto_updates true
  # The bare symbol, not the comparison-string form. For a cask a symbol already
  # means "this version or newer" — brew info renders it as macOS >= 14 either
  # way — but RuboCop's Homebrew/OSDependsOn rejects the string, and brew style
  # is a hard gate in the publish job. The string sat here unnoticed because that
  # job runs only on publish=true, which nothing used until 0.1.3.
  depends_on macos: :sonoma

  app "Auracle.app"

  caveats <<~EOS
    Auracle needs Full Disk Access to import your locally synchronized Messages database.
    Open Auracle and follow Sources → iMessage after installation.
  EOS
end

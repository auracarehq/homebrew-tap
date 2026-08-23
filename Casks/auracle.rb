# typed: strict
# frozen_string_literal: true

cask "auracle" do
  version "0.1.4.263"
  sha256 "14fbb02ae20eec983164f7afa9e92d162064b5a87239ebb5a184d296595f6f30"

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

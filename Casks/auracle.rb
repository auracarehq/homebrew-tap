# typed: strict
# frozen_string_literal: true

cask "auracle" do
  version "0.1.3"
  sha256 "0c918a05b1b6d407c5b0c2baf81f216579f5eaa792d69edf0466f993859e6f5c"

  url "https://github.com/auracarehq/homebrew-tap/releases/download/mac-v#{version}/Auracle.dmg"
  name "Auracle."
  desc "Personal wellness twin with private local-data connectors"
  homepage "https://auracle.health/"

  auto_updates true
  depends_on macos: :sonoma

  app "Auracle.app"

  caveats <<~EOS
    Auracle needs Full Disk Access to import your locally synchronized Messages database.
    Open Auracle and follow Sources → iMessage after installation.
  EOS
end

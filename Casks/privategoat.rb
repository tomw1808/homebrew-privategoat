cask "privategoat" do
  version "0.1.16"
  sha256 "b17e2984c4cc30f681a58bd2134682bb80b9610433f76ebe2e0297325f3a7182"

  url "https://github.com/tomw1808/homebrew-privategoat/releases/download/v#{version}/PrivateGoat-#{version}.zip",
      verified: "github.com/tomw1808/homebrew-privategoat/"
  name "PrivateGoat"
  desc "Local meeting transcription and dictation"
  homepage "https://privategoat.app"

  livecheck do
    url "https://privategoat.app/appcast.xml"
    strategy :sparkle
  end

  # The app updates itself through Sparkle, so `brew upgrade` leaves it alone
  # unless asked with --greedy.
  auto_updates true

  # Liquid Glass needs macOS 26, and this build ships arm64 whisper.cpp only.
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "PrivateGoat.app"

  uninstall quit: "app.privategoat.PrivateGoat"

  zap trash: [
    "~/Library/Application Support/Sonavia",
    "~/Library/Caches/app.privategoat.PrivateGoat",
    "~/Library/HTTPStorages/app.privategoat.PrivateGoat",
    "~/Library/Preferences/app.privategoat.PrivateGoat.plist",
    "~/Library/Saved Application State/app.privategoat.PrivateGoat.savedState",
  ]
end

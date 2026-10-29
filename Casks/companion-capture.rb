# Homebrew Cask for Companion Capture (tray capture client for CI-Server)
cask "companion-capture" do
  version "0.2.0-alpha.8"

  on_arm do
    sha256 "69c7a287bbb993cb71abeabdf7dd06d2d8e51c37947b9e63df56466f4b454109"

    url "https://github.com/companionintelligence/CI-Capture/releases/download/v#{version}/Companion.Capture_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "640475d45e1121d08606bf66962a84f13e5f85dd86e99b71d38df4110eb08503"

    url "https://github.com/companionintelligence/CI-Capture/releases/download/v#{version}/Companion.Capture_#{version}_x64.dmg"
  end

  name "Companion Capture"
  desc "Menu-bar capture client that sends screenshots and files to your own Companion Memory"
  homepage "https://ci.computer/download"

  depends_on :macos

  app "Companion Capture.app"

  zap trash: [
    "~/Library/Application Support/com.compint.CompanionCapture",
    "~/Library/Caches/com.compint.CompanionCapture",
    "~/Library/Preferences/com.compint.CompanionCapture.plist",
  ]
end

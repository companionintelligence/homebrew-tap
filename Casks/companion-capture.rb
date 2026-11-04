# Homebrew Cask for Companion Capture (tray capture client for CI-Server)
cask "companion-capture" do
  version "0.2.0-alpha.9"

  on_arm do
    sha256 "f9ce087ebdfecb63d79e22685754ccfe4797e12b1aa49d2025e8032a9a6e0e3e"

    url "https://github.com/companionintelligence/CI-Capture/releases/download/v#{version}/Companion.Capture_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "bc7c31efc822d532be130017348e8a2ad653cca8869d752fd0926ec206d0b13c"

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

# Homebrew Cask for Companion Capture (tray capture client for CI-Server)
cask "companion-capture" do
  version "0.2.0-alpha.7"

  on_arm do
    sha256 "62aa59d548b4110a3b6b56bfdbcf28118ec421dd574600182e4da538f8d345be"
    url "https://github.com/companionintelligence/CI-Capture/releases/download/v#{version}/Companion.Capture_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "362ef4f8e0a79f5f649eae78aab07756dff612c50ea3199e5e82a3141679578e"
    url "https://github.com/companionintelligence/CI-Capture/releases/download/v#{version}/Companion.Capture_#{version}_x64.dmg"
  end

  name "Companion Capture"
  desc "Menu-bar capture client that sends screenshots and files to your own Companion Memory"
  homepage "https://ci.computer/download"

  depends_on macos: ">= :big_sur"

  app "Companion Capture.app"

  zap trash: [
    "~/Library/Application Support/com.compint.CompanionCapture",
    "~/Library/Caches/com.compint.CompanionCapture",
    "~/Library/Preferences/com.compint.CompanionCapture.plist",
  ]
end

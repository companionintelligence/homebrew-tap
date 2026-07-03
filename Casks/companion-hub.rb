# Homebrew Cask formula for Companion Hub
# Published via: https://github.com/companionintelligence/homebrew-tap
# Installers are served from the public CDN (CI-Hub GitHub releases are private).

cask "companion-hub" do
  version "0.2.37"

  on_intel do
    url "https://dl.ci.computer/v0.2.37/macos/intel/Companion%20Hub_0.2.37_x64.dmg"
    sha256 "e122fe7dfc69c51112cb81aab7543e11ae4ac0fef3a8966b90c0bd1ceb19df04"
  end

  on_arm do
    url "https://dl.ci.computer/v0.2.37/macos/arm/Companion%20Hub_0.2.37_aarch64.dmg"
    sha256 "a08866131bb32176e4e2459b77a241841f3438ddef1a30e76c8c41b59e0243dd"
  end

  name "Companion Hub"
  desc "Self-hosted app platform and local AI hub from Companion Intelligence"
  homepage "https://ci.computer/hub"

  app "Companion Hub.app"

  zap trash: [
    "~/Library/Application Support/computer.ci.app.hub",
    "~/Library/Caches/computer.ci.app.hub",
    "~/Library/Preferences/computer.ci.app.hub.plist",
    "~/Library/Saved Application State/computer.ci.app.hub.savedState",
    "~/Library/WebKit/computer.ci.app.hub",
  ]
end

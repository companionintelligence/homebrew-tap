# Homebrew Cask for the Companion Memory desktop app (universal macOS build, signed and notarized)
cask "companion-memory" do
  version "0.1.3"
  sha256 "1fb99cf3444f4df6cbdaf9c18040de4e921a26dc694a2d2a53d61450cb4343d1"

  url "https://github.com/companionintelligence/Companion-Memory/releases/download/desktop-v#{version}/Companion.Memory_#{version}_universal.dmg"
  name "Companion Memory"
  desc "Private, self-hosted memory for your digital life and your AI agents"
  homepage "https://ci.computer/memory"

  # This repo's "Latest" release is the server (v2026.10.23), not the desktop app, so
  # the default GitHub-latest check would report a version that is not a desktop build.
  # The desktop builds are the desktop-v* tags.
  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on :macos

  app "Companion Memory.app"

  # The memory store itself lives in Docker volumes, which zap does not touch.
  zap trash: [
    "~/Library/Application Support/computer.ci.app.server",
    "~/Library/Caches/computer.ci.app.server",
    "~/Library/HTTPStorages/computer.ci.app.server.binarycookies",
    "~/Library/WebKit/computer.ci.app.server",
  ]

  caveats <<~EOS
    Companion Memory runs its server in Docker. Install and start Docker Desktop (or another
    Docker engine with Compose 2.24.4 or newer) before you open the app.
  EOS
end

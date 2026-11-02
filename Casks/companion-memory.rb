# Homebrew Cask for the Companion Memory desktop app (universal macOS build, signed and notarized)
cask "companion-memory" do
  version "0.1.8"
  sha256 "5270b87fe19d0de14f318e11b344727197499e4535c9013d0ae8c8b4459e8232"

  url "https://github.com/companionintelligence/Companion-Memory/releases/download/desktop-v#{version}/Companion.Memory_#{version}_universal.dmg"
  name "Companion Memory"
  desc "Private, self-hosted memory for your digital life and your AI agents"
  homepage "https://ci.computer/memory"

  # The repo's Latest release is the server, not the desktop app, so Homebrew's default check
  # would report a server version. The desktop builds are the desktop-v* releases, and one only
  # counts once it lists the universal dmg this cask installs (some desktop releases carry
  # Windows and Linux builds only).
  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"] || release["prerelease"]
        next unless release["assets"]&.any? { |asset| asset["name"].to_s.end_with?("_universal.dmg") }

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
    Docker engine with Compose 2.24.4 or newer) before you open the app. The first launch pulls
    the app's container images (about 3 GB) and, if no Ollama is running or on your PATH,
    downloads Ollama and up to two models.

    Uninstalling the app does not stop its containers or delete the Docker volumes that hold
    your memory. Choose Stop Stack in the app's tray menu first if you want the containers stopped.
  EOS
end

class AgentSync < Formula
  desc "Portable control plane for Companion Intelligence agent harnesses"
  homepage "https://github.com/companionintelligence/CI-Agent-Sync"
  url "https://github.com/companionintelligence/CI-Agent-Sync/releases/download/v0.2.0/CI-Agent-Sync-0.2.0.tar.gz"
  sha256 "af88d9a8a80fa0267298833068362baa7823f02e574a44dc954a51825fdbc377"
  license "PolyForm-Noncommercial-1.0.0"

  depends_on "node"

  def install
    system "npm", "ci", "--omit=dev", "--ignore-scripts"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/agentctl"
    bin.install_symlink libexec/"bin/agent-atlas"
  end

  test do
    assert_match "agentctl", shell_output("#{bin}/agentctl --help 2>&1")
  end
end

<h1 align="center">Companion Intelligence Homebrew Tap</h1>

<p align="center"><strong>Homebrew tap for Companion Intelligence desktop apps.</strong></p>

[![Hub release](https://img.shields.io/github/v/release/companionintelligence/Companion-Hub?style=flat-square&color=0a6358&label=Hub%20release)](https://github.com/companionintelligence/Companion-Hub/releases/latest)
[![platform](https://img.shields.io/badge/platform-macOS%20%C2%B7%20Apple%20Silicon%20%C2%B7%20Intel-0a6358?style=flat-square)](https://github.com/companionintelligence/homebrew-tap)
[![License](https://img.shields.io/badge/license-Not%20specified-757575?style=flat-square)](https://github.com/companionintelligence/homebrew-tap?tab=readme-ov-file#license)
[![Discord](https://img.shields.io/badge/chat-Discord-5865F2?style=flat-square&logo=discord&logoColor=white)](https://discord.com/invite/yQp9hwpzAa)

<p align="center"><a href="#install-companion-hub-macos">Get started</a> · <a href="https://docs.ci.computer/docs/reference/open-source-systems">Systems map</a> · <a href="README.md#install-companion-hub-macos">Documentation</a></p>

<p align="center">
  <a href="#install-companion-hub-macos"><img src="https://img.shields.io/badge/Install%20Companion%20Hub-Install%20Companion%20Hub-0a6358?style=for-the-badge&logo=apple&logoColor=white" alt="Install Companion Hub" height="30"></a>
</p>

## Features

| Feature | What it provides |
|---|---|
| **Companion Hub Cask** | Install the signed/release DMG selected for Intel or Apple Silicon. |
| **Checksum verification** | Pin SHA-256 for the selected release asset. |
| **Upgrade behavior** | Keep user data while replacing the desktop app bundle. |

## How it fits together

The tap does not build Hub: it selects the matching release DMG, verifies its SHA-256 and installs the macOS app bundle.

```mermaid
flowchart LR
  HubRelease[Companion Hub release assets] --> Cask[Homebrew Cask]
  Cask --> Verify[SHA-256 check]
  Verify --> Mac[macOS application bundle]
```

## Install Companion Hub (macOS)

```bash
brew tap companionintelligence/homebrew-tap
brew trust companionintelligence/homebrew-tap   # first time only, on recent Homebrew
brew install --cask companion-hub
```

## Update

```bash
brew update
brew upgrade --cask companion-hub
```

Manifests are generated from [CI-Hub `distribution/`](https://github.com/companionintelligence/CI-Hub/tree/dev/distribution) on each desktop release.

<!-- companion-hub-readme-deep-review -->

## macOS package behavior

| Architecture | Download |
|---|---|
| Apple silicon | Release DMG built for `aarch64` |
| Intel | Release DMG built for `x64` |

Homebrew tracks the Companion Hub release and installs `Companion Hub.app`. `brew uninstall --cask companion-hub` removes the app; the cask's `zap` cleanup targets Hub-specific support files, caches, preferences, and tunnel token files. Review the cleanup list before using `--zap` if you want to keep local Hub data.


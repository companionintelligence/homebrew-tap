<h1 align="center">Companion Intelligence Homebrew Tap</h1>

<p align="center"><strong>Homebrew tap for Companion Intelligence desktop apps.</strong></p>

<p align="center"><a href="#install-companion-hub-macos">Get started</a> · <a href="https://docs.ci.computer/docs/reference/open-source-systems">Systems map</a></p>


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


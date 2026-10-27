<h1 align="center">Companion Intelligence Homebrew Tap</h1>

<p align="center"><strong>Homebrew tap for Companion Intelligence desktop apps.</strong></p>

<p align="center"><a href="#install-companion-hub-macos">Get started</a></p>


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

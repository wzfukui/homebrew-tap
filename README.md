# Homebrew Tap for `psmore`

This repository maintains the Homebrew formula for:

- **psmore** — relationship-first process diagnostics workbench

Formula source: https://github.com/wzfukui/psmore

## Install

```bash
brew tap wzfukui/tap
brew install psmore
```

If you already installed psmore, upgrade to latest:

```bash
brew update
brew upgrade wzfukui/tap/psmore
```

## Upgrade, reinstall, uninstall

```bash
# Upgrade only
brew upgrade wzfukui/tap/psmore

# Force reinstall (same effect as cleaning local build artifacts and reinstalling)
brew reinstall psmore

# Remove and install again
brew uninstall psmore
brew install wzfukui/tap/psmore
```

## Maintenance

- Current formula version in this tap tracks upstream GitHub releases.
- Formula file: [`Formula/psmore.rb`](./Formula/psmore.rb)
- Current tracked version: **`v0.1.2`**

## Local troubleshooting

- Check installed version:
  ```bash
  psmore --version
  brew info psmore
  ```
- If `brew info` still shows older version:
  ```bash
  brew untap wzfukui/tap
  brew tap wzfukui/tap
  brew update
  brew upgrade wzfukui/tap/psmore
  ```

## Automated formula bump

This tap includes CI workflow: `.github/workflows/bump-psmore-formula.yml`

- Runs every Monday.
- Detects latest `vX.Y.Z` from `wzfukui/psmore` release page.
- Rebuilds tarball SHA256, updates `Formula/psmore.rb`, and opens a PR automatically.
- You can also trigger it manually from GitHub Actions (`workflow_dispatch`).

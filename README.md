# Eminzo Homebrew tap

Install the [Eminzo](https://eminzo.dev) desktop app on macOS with [Homebrew](https://brew.sh).

```sh
brew tap bqsistemas/tap
brew trust bqsistemas/tap
brew install --cask eminzo
```

Homebrew 7 and later only load third-party taps you trust, so `brew trust` is needed once. On older Homebrew versions, skip that line.

The cask installs the same signed and notarized build as the [download page](https://eminzo.dev/download/), for Apple silicon or Intel automatically. It requires macOS 13 Ventura or later.

Eminzo runs on the Eminzo CLI, so install it once too:

```sh
npm i -g @eminzo/factory
```

## Updates

The app updates itself when a new version is out, so there is nothing to do. `brew upgrade --cask eminzo` also works; Homebrew skips apps that update themselves unless you add `--greedy`.

## Uninstall

```sh
brew uninstall --cask eminzo          # remove the app
brew uninstall --cask --zap eminzo    # also remove its settings and caches
```

## Casks

| Cask | Description |
|---|---|
| [`eminzo`](Casks/eminzo.rb) | The Eminzo desktop app (dashboard, pipeline and terminal for repositories with the Eminzo factory installed) |

Releases are published in [bqsistemas/eminzo-ai-factory](https://github.com/bqsistemas/eminzo-ai-factory/releases). Report problems with the app there; report problems with the cask itself in this repository.

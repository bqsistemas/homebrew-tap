cask "eminzo" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "59a0efb0cca55e7d1ea47d3c3cd52761ef4e44ada5fa694b74683c7248e33228",
         intel: "9e2f85b7423caa2c3ba1274528981d876e05d234bdb3e608ada4d7ef996fc0ba"

  url "https://github.com/bqsistemas/eminzo-ai-factory/releases/download/desktop-v#{version}/Eminzo-mac-#{arch}.dmg"
  name "Eminzo"
  desc "AI software factory that turns GitHub issues into reviewed pull requests"
  homepage "https://eminzo.dev/"

  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Eminzo.app"

  zap trash: [
    "~/Library/Application Support/Eminzo",
    "~/Library/Caches/com.bqsistemas.eminzo",
    "~/Library/Caches/com.bqsistemas.eminzo.ShipIt",
    "~/Library/Caches/eminzo-updater",
    "~/Library/Logs/Eminzo",
    "~/Library/Preferences/com.bqsistemas.eminzo.plist",
    "~/Library/Saved Application State/com.bqsistemas.eminzo.savedState",
  ]

  caveats <<~EOS
    Eminzo runs on the Eminzo CLI. Install it once with:
      npm i -g @eminzo/factory
      eminzo install
  EOS
end

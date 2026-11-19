cask "eminzo" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "8976ded6a0c384b2a987f27a625c10cb614823f493e7dc4f2a0d09e9870c616e",
         intel: "780dff69d24a8f319dfa2f4a093321a2b40902c6e127c6782de5d2b01dc3e293"

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

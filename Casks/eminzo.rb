cask "eminzo" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "c2e8eb1872d31e18c5f59202464f16cf16667364787d7b2a841498b9c2e63386",
         intel: "8735214357dd733124264f315931c58c86a8c52942841c89a5493204dfc9e8a6"

  url "https://github.com/bqsistemas/eminzo-ai-factory/releases/download/desktop-v#{version}/Eminzo-mac-#{arch}.dmg",
      verified: "github.com/bqsistemas/eminzo-ai-factory/"
  name "Eminzo"
  desc "AI software factory that turns GitHub issues into reviewed pull requests"
  homepage "https://eminzo.dev/"

  livecheck do
    url :url
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

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
  EOS
end

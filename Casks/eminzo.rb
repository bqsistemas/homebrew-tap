cask "eminzo" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "fd13b5f6b99c3959bfa53fc2cadf79b45275a36c76f2f61b85f259b6c0d31b3a",
         intel: "8b606be1b2e70e394c655121d5c340c45221367294999544004dabb4d79245c5"

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

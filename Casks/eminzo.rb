cask "eminzo" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "1b0c936d5c14f765c7d1f7ef8eacba663c779aca144feaec831488e5818f1e82",
         intel: "61227cd22ea82c1afb8323528a25124346e4828e145749812d472c86b10bccc7"

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

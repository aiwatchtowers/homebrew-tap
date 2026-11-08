cask "watchtower" do
  version "0.27.0"
  sha256 "6382dd8b9dfe49c8a5b50269e9ad02278b2f2eb0a01f1a3ac828921945a0e2ea"

  url "https://github.com/aiwatchtowers/watchtower/releases/download/v#{version}/Watchtower-#{version}-arm64.zip"
  name "Watchtower"
  desc "Reads Slack, mail, calendar and Jira and gives coding agents a board"
  homepage "https://aiwatchtowers.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Watchtower.app"
  binary "#{appdir}/Watchtower.app/Contents/MacOS/watchtower"

  zap trash: [
    "~/.config/watchtower",
    "~/.local/share/watchtower",
    "~/Library/Application Support/Watchtower",
    "~/Library/Caches/com.watchtower.desktop",
    "~/Library/HTTPStorages/com.watchtower.desktop",
    "~/Library/Preferences/com.watchtower.desktop.plist",
    "~/Library/Saved Application State/com.watchtower.desktop.savedState",
    "~/Library/WebKit/com.watchtower.desktop",
  ]
end

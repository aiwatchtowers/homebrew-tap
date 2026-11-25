cask "watchtower" do
  version "0.29.5"
  sha256 "0d20b94df724445be385112a025cf85905f1bc85e3e6c4978a988b84c12d0ba6"

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

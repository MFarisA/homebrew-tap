cask "aiusagebar" do
  version "1.0.3"
  sha256 "9614b96a2b28c43562607e2d211ac962ccb501bd69e966f16d1db678a28bfe95"

  url "https://github.com/MFarisA/aiUsage/releases/download/v#{version}/aiUsageBar.dmg"
  name "aiUsageBar"
  desc "Native macOS SwiftUI Menu Bar AI token usage tracker"
  homepage "https://github.com/MFarisA/aiUsage"

  app "aiUsageBar.app"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/aiUsageBar.app"],
                   sudo: false
  rescue
    nil
  end

  zap trash: [
    "~/Library/Preferences/com.mfarisa.aiUsageBar.plist",
  ]
end

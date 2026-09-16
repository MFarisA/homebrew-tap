cask "aiusagebar" do
  version "1.0.1"
  sha256 "3c7fa959adabad10427f1371146e4a700c0dedbd18f5f601fd05f2ec6059f656"

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

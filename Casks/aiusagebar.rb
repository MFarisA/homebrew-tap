cask "aiusagebar" do
  version "1.0.2"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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

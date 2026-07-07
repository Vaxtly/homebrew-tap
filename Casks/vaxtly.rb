cask "vaxtly" do
  version "0.12.0"

  on_arm do
    sha256 "62978e4f2f6c62d1cfd29ec16d1b1a46a5808cb19a71ccd3bd80fd1636e12e8a"
    url "https://github.com/vaxtly/app/releases/download/v#{version}/Vaxtly-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "7e653c0bfec1d75bc52fead460f460a9b6d770d522d49995423049f66295e4c0"
    url "https://github.com/vaxtly/app/releases/download/v#{version}/Vaxtly-#{version}-x64.dmg"
  end

  name "Vaxtly"
  desc "API testing tool"
  homepage "https://vaxtly.github.io"

  app "Vaxtly.app"

  postflight do
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/Vaxtly.app"
  end

  zap trash: [
    "~/Library/Application Support/Vaxtly",
    "~/Library/Preferences/com.vaxtly.app.plist",
    "~/Library/Saved Application State/com.vaxtly.app.savedState",
  ]
end

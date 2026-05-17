cask "vaxtly" do
  version "0.11.2"

  on_arm do
    sha256 "1a5b792131ce0a5a4c49d7f23ce8b7fead23119ccf51dbc15d2c11da8eb2423c"
    url "https://github.com/vaxtly/app/releases/download/v#{version}/Vaxtly-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "263660c36487c6fecd8befb9e5f6a36d3dea0000022730abc0a8208eebff4616"
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

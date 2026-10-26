cask "vatya" do
  version "0.1.8"
  sha256 "eaa512ca74cbd409d748838a564f0ce5d66b7a77e7d1ccc2a02222bd73e7d74a"

  url "https://dl.vyamoh.com/vatya/#{version}/Vatya-#{version}-macos-arm64.zip"
  name "Vatya"
  desc "Menu bar developer utilities"
  homepage "https://vyamoh.com"

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Vatya.app"

  # Releases are ad-hoc signed and not notarized; without this, Gatekeeper
  # blocks the first launch and every upgrade.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Vatya.app"]
  end

  zap trash: "~/Library/Containers/vyamoh.vatya"
end

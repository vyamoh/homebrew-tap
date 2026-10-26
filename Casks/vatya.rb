cask "vatya" do
  version "0.1.10"
  sha256 "6b748baa7c96956ed06e680d4ce5ab82b16a9dec9cb69b909413d43cfb74e3e1"

  url "https://dl.vyamoh.com/vatya/#{version}/Vatya-#{version}-macos-arm64.zip"
  name "Vatya"
  desc "Menu bar developer utilities"
  homepage "https://vyamoh.com/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Vatya.app"

  # Releases are ad-hoc signed and not notarized; without this, Gatekeeper
  # blocks the first launch and every upgrade.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Vatya.app"]
  end

  zap trash: "~/Library/Containers/vyamoh.vatya"
end

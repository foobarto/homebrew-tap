# Maintained by .github/workflows/sync-stado-release.yml. DO NOT EDIT BY HAND;
# edits are overwritten on the next sync. stado ships Linux-only release
# artifacts (its runtime depends on Linux kernel primitives: bwrap, namespaces,
# Landlock), so this cask serves linux/amd64 and linux/arm64 only.
cask "stado" do
  version "0.80.2"

  on_linux do
    on_intel do
      sha256 "f0be942e2f8fdca59a4c5111e4e2eeac6f85d9b9fdb8800f587b921fee2d2c60"
      url "https://github.com/foobarto/stado/releases/download/v#{version}/stado_#{version}_linux_amd64.tar.gz"
    end
    on_arm do
      sha256 "5dccf5174472294ad24748d67d10a101b20a580e1d92830a340b74bd9fd2f332"
      url "https://github.com/foobarto/stado/releases/download/v#{version}/stado_#{version}_linux_arm64.tar.gz"
    end
  end

  name "stado"
  desc "Sandboxed, git-native coding-agent runtime"
  homepage "https://github.com/foobarto/stado"

  livecheck do
    skip "Auto-synced from the latest GitHub release."
  end

  binary "stado"

  # No zap stanza required

end

# typed: false
# frozen_string_literal: true

# Homebrew formula for devbox — disposable, CWD-mounted dev VMs on Lima with an
# AI-CLI toolchain (claude, codex, opencode, stado) + Homebrew.
#
# Stable release by default; a development checkout remains available with
# `brew install --HEAD foobarto/tap/devbox`.
#
#   brew install foobarto/tap/devbox
#   brew upgrade foobarto/tap/devbox
class Devbox < Formula
  desc "Disposable, CWD-mounted dev VMs on Lima with an AI-CLI toolchain"
  homepage "https://github.com/foobarto/devbox"
  url "https://github.com/foobarto/devbox/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9a6cccf8c284ff083636a4e37cc3d4e9bf2453d8a3aba3b4caa2df37e7a20d57"
  license "MIT"
  head "https://github.com/foobarto/devbox.git", branch: "main"

  # NOTE: intentionally no `depends_on "lima"`. Many users (and this tap's
  # author) run a manually-pinned limactl outside Homebrew; a hard dep would
  # install a second, redundant lima. devbox checks for limactl at runtime and
  # errors clearly if it's absent. `brew install lima` if you want brew to own it.

  def install
    bin.install "bin/devbox"
    chmod 0755, bin/"devbox"
    version_text = (buildpath/"VERSION").read
    (prefix/"VERSION").write version_text

    # Ship the AI proxy + example hooks; expose a thin launcher on PATH.
    libexec.install "proxy", "examples"
    (libexec/"VERSION").write version_text
    (bin/"devbox-ai-proxy").write <<~SH
      #!/bin/bash
      exec "#{libexec}/proxy/run.sh" "$@"
    SH
    chmod 0755, bin/"devbox-ai-proxy"
  end

  def caveats
    <<~EOS
      devbox requires Lima (limactl) on your PATH, with a QEMU or VZ backend.
      Install it however you prefer, e.g. `brew install lima`.

      In any project directory:
        devbox                 # builds the golden image once, then clone + shell

      The AI proxy (devbox-ai-proxy) additionally needs python3 on PATH
      (standard library only). Host-side config lives under ~/.config/devbox/.

      Docs: #{homepage}
    EOS
  end

  test do
    # --help is dispatched before the limactl check, so it runs with no VM stack.
    assert_match "disposable", shell_output("#{bin}/devbox --help")
    assert_equal "devbox 1.2.0", shell_output("#{bin}/devbox --version").strip
    assert_equal "devbox-ai-proxy 1.2.0", shell_output("#{bin}/devbox-ai-proxy --version").strip
    assert_predicate bin/"devbox-ai-proxy", :executable?
  end
end

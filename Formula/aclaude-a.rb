# Homebrew formula for aclaude-a (alpha channel)
# Updated automatically by CI on every push to main
# macOS only (arm64). Linux users: use install.sh or build from source.

class AclaudeA < Formula
  desc "Opinionated wrapper for Claude Code with persona theming (alpha channel)"
  homepage "https://github.com/arcaven/aclaude"
  url "https://github.com/arcaven/aclaude/releases/download/alpha-20260318-071559-0e9dbaf/aclaude-a-darwin-arm64"
  version "alpha-20260318-071559-0e9dbaf"
  sha256 "7e6ad252c516337706d671a9f64ce2a6e16170e55e12bc9e29c7ca88d9b15f61"
  license "MIT"

  def install
    bin.install "aclaude-a-darwin-arm64" => "aclaude-a"
  end

  def caveats
    <<~EOS
      aclaude-a is the alpha channel. Updates on every push to main.
      For stable: brew install arcaven/tap/aclaude
      Requires Claude Code CLI (claude).
    EOS
  end

  test do
    assert_match "aclaude", shell_output("#{bin}/aclaude-a --version 2>&1")
  end
end

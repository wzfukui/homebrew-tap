class Psmore < Formula
  desc "Relationship-first process diagnostics workbench for macOS and Linux"
  homepage "https://github.com/wzfukui/psmore"
  url "https://github.com/wzfukui/psmore/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "eb6b18e32ba464fd92613b6a972fc8d186382b825d493d0f18bf392ca1113d1a"
  license "MIT"
  head "https://github.com/wzfukui/psmore.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/psmore --version")
    assert_match "psmore", shell_output("#{bin}/psmore --help")
  end
end

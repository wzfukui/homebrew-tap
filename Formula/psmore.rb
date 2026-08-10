class Psmore < Formula
  desc "Relationship-first process diagnostics workbench for macOS and Linux"
  homepage "https://github.com/wzfukui/psmore"
  url "https://github.com/wzfukui/psmore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5b123f8c909f67092e1053a5365df1c36b1c30270ac9cf08b9e54308250f9f43"
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

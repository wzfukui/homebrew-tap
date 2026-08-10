class Psmore < Formula
  desc "Relationship-first process diagnostics workbench for macOS and Linux"
  homepage "https://github.com/wzfukui/psmore"
  url "https://github.com/wzfukui/psmore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "840eb3067b70a4d2fd71f85a699b4b0e2f220d9fb8b09d21629595440e1515d9"
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

class Psmore < Formula
  desc "Relationship-first process diagnostics workbench for macOS and Linux"
  homepage "https://github.com/wzfukui/psmore"
  url "https://github.com/wzfukui/psmore/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "9bf240093a3e4ae284a5d5b3f6a781e6d0c376b8cfa31fddda92edcf8e297cf0"
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

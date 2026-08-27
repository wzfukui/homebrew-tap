class Psmore < Formula
  desc "Relationship-first process diagnostics workbench for macOS and Linux"
  homepage "https://github.com/wzfukui/psmore"
  url "https://github.com/wzfukui/psmore/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "23c5a428802ecf9daa6d18196596589a8605926d9eaf594c98f564590f705925"
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

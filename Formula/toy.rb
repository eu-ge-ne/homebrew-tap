class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.21.tar.gz"
  sha256 "4d97ffbedcd0a86d6dd48a20d1e2a7218b44ad33c3748ac15dd0cb0ca8577898"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/toy/releases/download/v0.0.21"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c52076d0138bbd99a58e376f37e3cb001d2e7bea8fcd000995c4baad6940e78"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-RW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.21\n", shell_output("#{bin}/toy --version")
  end
end

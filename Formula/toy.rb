class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.18.tar.gz"
  sha256 "cf654952e97306050c5e45e5434e6833a0a86c8cbe573bff15660393472041b1"
  license "MIT"

  depends_on "deno"

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-RW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.18\n", shell_output("#{bin}/toy --version")
  end
end

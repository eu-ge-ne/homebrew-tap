class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.20.tar.gz"
  sha256 "3e2e1f8bf02ac4ae084b2ae1a6f4c55b0126804e3638260f5658511b6b432ec1"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/toy/releases/download/v0.0.20"
  end

  depends_on "deno"

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-RW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.12\n", shell_output("#{bin}/toy --version")
  end
end

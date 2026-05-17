class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.29.tar.gz"
  sha256 "4fc56f3a9096ced72596d4d04d8adca80313d29bbdf07c7b7de8eb2179c3bfac"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.29"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3af06ececf89eb79ba2fad235e657bdd8f39bb5594ac93ef46af1f3aaba2780b"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "src/main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy 0.0.29 (deno 2", shell_output("#{bin}/toy --version")
  end
end

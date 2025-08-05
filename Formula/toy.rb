class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.23.tar.gz"
  sha256 "2581347bff15722d08261c14b24a971ff829a04be691ff8774c906823b1a690c"
  license "MIT"

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.23\n", shell_output("#{bin}/toy --version")
  end
end

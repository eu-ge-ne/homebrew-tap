class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.24.tar.gz"
  sha256 "e1477627363d2500883e334615b7f98405ef9022373696d943a45160c04389a7"
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

class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.20.tar.gz"
  sha256 "4dbf2d26f64729d569e8634a22d2120504836702a7c8d99c0c8a412a204f7b72"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/toy/releases/download/v0.0.20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0db000bdca1c455f99039eca3bcb90817dbda0f86791181ec21aa38a61c14967"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-RW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.20\n", shell_output("#{bin}/toy --version")
  end
end

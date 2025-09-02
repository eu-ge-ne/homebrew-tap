class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.27.tar.gz"
  sha256 "8ef6fa9b6207a71aeb30e1fe777a1c6b07220f44db49dc532ef4b65c67d2f451"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.26"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1f1b9bf1de9e8a49967b9b0215ed2aa434d0038b04cb0e0c5d87c1d4d5999b51"
    sha256 cellar: :any_skip_relocation, ventura:       "b1fc244c619dbea74a35b1679fbf4367bb2920b5689bbcd52af5dd573039f9c9"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy 0.0.27 (deno 2", shell_output("#{bin}/toy --version")
  end
end

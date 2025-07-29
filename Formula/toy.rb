class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.19.tar.gz"
  sha256 "d425b4a9e23cdd3e65fb0394026776e605cda5b4b05d670e6b39e006e2c8b7d5"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/toy/releases/download/v0.0.19"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "028218123a11c53da834bed477c0e3b9df857fa2d28f5e1ce2936f77b3ca0a15"
  end

  depends_on "deno"

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-RW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.19\n", shell_output("#{bin}/toy --version")
  end
end

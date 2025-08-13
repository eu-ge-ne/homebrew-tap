class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.26.tar.gz"
  sha256 "e377e3964c95c68c463ed52d12f92b996c8bda702ec75adf96006fe986c33d73"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.25"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "122baef2005cf05cae6e9b76f25b6d020b7ad881eac59efb389b75705d5b52da"
    sha256 cellar: :any_skip_relocation, ventura:       "7563b8d03b8053550762b82b18c69a8d54ca3f7fdf9e0f65487ca64a020a4353"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.26\n", shell_output("#{bin}/toy --version")
  end
end

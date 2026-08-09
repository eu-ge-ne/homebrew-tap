class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.32.tar.gz"
  sha256 "00acf6b2d62215a9d1be6dbd08a84675afc28caa4f4dafca58ad4f0e5b7e0452"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.31"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bb2a61f8f420ad2b891df3878b1b763828239cb3a63a8333f6901d079b55394b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ee9777215a02c362d0073ce7a7fedfa1031b4fbeb0cba8aa318822d24e977550"
  end

  depends_on "deno" => :build

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "src/main.ts"
    bin.install "toy"
  end

  test do
    assert_match "toy #{version} (deno 2", shell_output("#{bin}/toy --version")
  end
end

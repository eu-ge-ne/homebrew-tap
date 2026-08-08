class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.31.tar.gz"
  sha256 "56c30e9f7f82695f95eb21e6c33b8ed84c6579279c6e7b5aa34569998f68998a"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.30_2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8f5e9f731365cdcd6621667685cb37ae0beaaaf058be9d75dfc0803b1a4ae1d6"
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

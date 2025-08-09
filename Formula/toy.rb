class Toy < Formula
  desc "Minimalistic TUI text editor"
  homepage "https://github.com/eu-ge-ne/toy"
  url "https://github.com/eu-ge-ne/toy/archive/refs/tags/v0.0.25.tar.gz"
  sha256 "d24351f3b5031ee94c5dc10d08d3637db9569226b79a733348744ad5f0b477bb"
  license "MIT"

  bottle do
    root_url "https://github.com/eu-ge-ne/homebrew-tap/releases/download/toy-0.0.24"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e1d33dd3541030da9fae10dad823eef0b80a81caf3f9ed76224921cd66237a6"
    sha256 cellar: :any_skip_relocation, ventura:       "38d8dbe012ace80e6067e5bba18a1b9c6e2d55be1ca46e57b45ca416df5ae1cc"
  end

  depends_on "deno" => [:build]

  def install
    system "deno", "compile", "--frozen", "--reload", "--output", "toy", "-ERW", "main.ts"
    bin.install "toy"
  end

  test do
    assert_equal "toy 0.0.25\n", shell_output("#{bin}/toy --version")
  end
end

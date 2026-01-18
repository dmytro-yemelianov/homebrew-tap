class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "4.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "753ec1c9ffff1bde336b3a0935fa069df186a690d68912835957eca247240163"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "7382b1be0bdf89decdbd4581f5ceaee19f94a10f5d1a1c756e12fb6e2e722e63"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "92607d4a2fcf9334360cf11d2cb972473af0058bba455d5e26e9d8437de9b466"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3f4d774a03062eb48cae696633429b67236586f44c4646510352da249b504621"
    end
  end

  def install
    bin.install "raps-cli" => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

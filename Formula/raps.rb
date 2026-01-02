class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-x64.tar.gz"
      sha256 "63d469d7b92f5c9d1d6ecef1f727028c56631a814ce122b38e738ca53fded840"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-arm64.tar.gz"
      sha256 "f29d92525b6b206c98cabd282ef1e4f91d186b529e3e6c5d2f29def95e408271"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-x64.tar.gz"
      sha256 "6a48c79d22487c5f605f69a0c2f637a787a867718d2130b7bf5343128dce3239"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-arm64.tar.gz"
      sha256 "20cd4b050bb6af4318d499b97e4dbfc81cd1bd90b20ad24126972d4a1a6fce4f"
    end
  end

  def install
    bin.install "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-x64.tar.gz"
      sha256 "d2cac32f47dccb3d593d94b0e9ed8a07eac206141797048d7d2afd11229c7f99"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-arm64.tar.gz"
      sha256 "775c196b32fe320e3added4c3bda0f9564779fe0530e7903aff464d33e8675cc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-x64.tar.gz"
      sha256 "d9f3a1c47ee3505b495812a6ce6836e97cc2633d2490223efb5ab7f57f3810fb"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-arm64.tar.gz"
      sha256 "21207eeacaf2e73ed0e7199193546160b0b9d1b4c00215d469bcdf40c6fe39f4"
    end
  end

  def install
    bin.install "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

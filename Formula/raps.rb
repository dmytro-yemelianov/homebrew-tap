class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "2874118c749fecdefac705bb1491784b370c10348baa83a0c55f8affe32c51e8"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "b421a7e08c6a958a6c13b1a29c1e60e9850da3e6c3f24d47e23475ee32295916"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3cdc1cb6c1e050f0eff977ced3fe9ca2cbfb38b7216afc9cde1bdc4808390623"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "471456ae2e82b28e895f50b2a80f73012329c1697fc40cf39a9575a14751f610"
    end
  end

  def install
    bin.install "raps-cli" => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "4.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "7a08dfc47ec0879a0ef293fcd7ac9dc054d017969834d675ad2bc7e8c2cad844"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "1609b7dd2f49d09dda00486e67067a4b334c8526966e013639a5c21cb3076df0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0e8168979d0dc6dfa82ce7f0ac339c779989ff110981e6355bdb95fbccca2382"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b4eb7f76351f2b343d644263729299c4da775859761d3a0aa42130dea57196ce"
    end
  end

  def install
    # cargo-dist extracts to a subdirectory, find the binary
    binary = Dir["raps-cli-*/raps"].first || Dir["*/raps"].first || "raps"
    bin.install binary => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

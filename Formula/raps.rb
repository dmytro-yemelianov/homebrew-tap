class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "5.4.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "feb03af5fc3f95499a9a778d2269c853a0f8fec239bf1ec5586a5dd26bacc67f"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "566a53234e3b676b33212d04e439f1c9d99904604733674d809758b77409cf5c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1282a6bf65c835948c2dc409d218367adf95af668f71d019a8b9882633b5631f"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "24a1b23cb726e9d2c867e912be473bc85c2c1dc90614c0614e19d252d698f0d1"
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

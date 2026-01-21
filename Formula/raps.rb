class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "4.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "2a1f9321a35e08c3f2d0a2bd5ad6bd467f637058a654ba5869093ef45445d2f1"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "2bc6a6c77faeb689106956d9d4db6e700df1677e876baa64406cc4e65519a406"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "32843253696e3e8e264150b15ae239696686feb7512d581dba8118eb4afc158c"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1763bffccc7c13857512b899e6d602b6f7c40dd386c8c699e35997bb1189e5e7"
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

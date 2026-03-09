class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "5.4.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "70bbc24490fc247b6ffaa4e12143fc97b576af906e452b40bf5e8e1abe5fc2ae"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "e77700386bb7ae359eaa36a1df2a14c6b092a59fd290e4594982af84d1186bb5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c4209701e3228a752b5f3e873ab98ff7c180760710f9a06d9245882f60d1a821"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "31093b0ada2b0ea453a575939b43c6fd87c9593c524097956572b355e30a7160"
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

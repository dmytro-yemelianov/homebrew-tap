class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "4.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "5d2253b3ce4fcf5e87d1409b8dc4bcb712e424253ec1ca466bbedda8627ce390"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "a3ee9086dddb0ea0414868af503a980746f955b4c182d746d0a79636320bca6b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7910e3c274986df1f6553c40b3ff6ab8233181def09b54d359470ae236c947dd"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "10cf16383940a9e8f5c0f880856ce94170aba80a29219e9c1dd5586a416f7a0c"
    end
  end

  def install
    bin.install "raps-cli" => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "066bca159620bc3e7e98cfbb6c3c4ec6bfe1456823ad24a4eecd6843850236ce"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "b46393cbf9b8ccd9d7525ec354580269f978663c952d35530064179ba6f7491a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "fcb4be13ec7c7f7355bf2a1c98a8b297b6ad10ed8ce82c7d0fc6fc99b601fe49"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2dba58f8b07c0ebf3cb59e1af346a7fb0e01ff315ea79e1f2a6e994528c00177"
    end
  end

  def install
    bin.install "raps-cli" => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

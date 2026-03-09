class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "5.4.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "1d89a3c95c726bfa611bb393d47db1ce353f1ad3f36274b28a53e3e8b8618a93"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "44bf48033ec9c533038ce79fd1908d0ba529469d970b424a0e901042b7f46095"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a3d09577ad7ea62f30bc79440f84367737efd7f68a2c6a5ccd2a623b88b66ce0"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d73ee8cf79d85295d4527bd24021c9089086456c174a3b828e6943e50510f488"
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

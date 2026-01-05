class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-x64.tar.gz"
      sha256 "f255320568793aaf3f6202059e73fd375a379854dbbd502f3659cc1c31a770a1"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-arm64.tar.gz"
      sha256 "5f529ebd1791ead3bf0694eeff7ff5da20d3e0e39b88c8221318e97d5f4bfb92"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-x64.tar.gz"
      sha256 "4bd42aa4219f80f0397d571413fe8c5b6550b11987f602eeaf6de428a6d7ad3d"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-arm64.tar.gz"
      sha256 "e74edaafd5a8186635652e53caa20fad5052112ad0acc5aa48ca6514f373dd66"
    end
  end

  def install
    bin.install "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

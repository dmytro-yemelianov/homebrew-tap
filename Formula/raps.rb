class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-x64.tar.gz"
      sha256 "4afbd831e750ffdace5e29e185c5c3ece6ec7a87d4fe7d60d744829dcc35f851"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-arm64.tar.gz"
      sha256 "895ff8b73dd127f3e2b1c6a67f12fe7a848f15b7a41668bbe72f3be516cf11dd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-x64.tar.gz"
      sha256 "696cfbd610da15ee988e5421977a85d573390d54b3a5ce117f93f527b8f47856"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-arm64.tar.gz"
      sha256 "44b6262df3118e5e637a5c6732dac3cc024b2c303cff043d4c666ee30bb97db2"
    end
  end

  def install
    bin.install "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

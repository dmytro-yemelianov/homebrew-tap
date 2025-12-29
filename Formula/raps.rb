class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "3.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-x64.tar.gz"
      sha256 "2de8168ba0e92d8147afb47afde2c0d1fd7f89cfb004565791e9ce40f2fcc60a"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-macos-arm64.tar.gz"
      sha256 "954f7ecd4da658d939c3e31da7a21f442d59a5915bf17515b6c432a6d0028b4a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-x64.tar.gz"
      sha256 "f8418e77d13150b0a3cc9a7273fc467d3a221d1e419d8dbfe604505377b8239c"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-linux-arm64.tar.gz"
      sha256 "8b072c58077086a03533b091f4b3102517253db597d998fc1ee80358d110e941"
    end
  end

  def install
    bin.install "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

class Raps < Formula
  desc "🌼 RAPS (rapeseed) — Rust Autodesk Platform Services CLI"
  homepage "https://rapscli.xyz"
  version "4.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-apple-darwin.tar.xz"
      sha256 "57bccd581af236fd2b198d37183eac4a317f9e85c4a5a39329886edcf22710d9"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-apple-darwin.tar.xz"
      sha256 "1ff0cc999219518b399eb08d2f8f13c59da91a33dd20d195cd69e7b6d56ab1b5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e82cf9eb3c549bfc17a19140fe3d1846b9dca54f35680e659f9739752d97d2dd"
    else
      url "https://github.com/dmytro-yemelianov/raps/releases/download/v#{version}/raps-cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3ef6a2aa48e652b23082ec5e93fa3b318ba2ab07168a8e6742d1fdf4d99747b4"
    end
  end

  def install
    bin.install "raps-cli" => "raps"
  end

  test do
    system "#{bin}/raps --version"
  end
end

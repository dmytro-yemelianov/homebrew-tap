class GlobeSwitch < Formula
  desc "Tap the Globe key to switch keyboard layouts on macOS instantly"
  homepage "https://github.com/dmytro-yemelianov/globe-switch"
  url "https://github.com/dmytro-yemelianov/globe-switch/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "087f6fc2a01b1df2cbda35de4a37fb6c2e98883856327371a6b12f9774649234"
  license "MIT"
  head "https://github.com/dmytro-yemelianov/globe-switch.git", branch: "main"

  depends_on macos: :ventura

  def install
    system "scripts/build-app.sh", "-", buildpath
    prefix.install "GlobeSwitch.app"
    bin.install_symlink prefix/"GlobeSwitch.app/Contents/MacOS/globe-switch"
  end

  def caveats
    <<~EOS
      Finish the setup, and repeat it after every upgrade:
        globe-switch install
      It copies GlobeSwitch.app to ~/Applications, starts it at login and sets
      "Press 🌐 key to" to Do Nothing. Then turn on GlobeSwitch in
      System Settings → Privacy & Security → Input Monitoring.

      Homebrew builds are signed ad-hoc, so Input Monitoring has to be granted again
      after each upgrade: remove GlobeSwitch there with − and run `globe-switch install`.

      To remove GlobeSwitch, run `globe-switch uninstall` before `brew uninstall globe-switch`.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/globe-switch --version").strip
  end
end

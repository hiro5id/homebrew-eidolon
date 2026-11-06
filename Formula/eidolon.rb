# Made by release.py from packaging/homebrew/eidolon.rb.in; the Release workflow commits it to hiro5id/homebrew-eidolon.
#   brew install hiro5id/eidolon/eidolon      brew upgrade eidolon
class Eidolon < Formula
  desc "Find copies and Live Photo pairs in a photo and video library by how they look"
  homepage "https://github.com/hiro5id/eidolon-releases"
  version "2026.11.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.1/eidolon-macos-arm64.tar.gz"
      sha256 "47036d250b29a28f7057b6e8e1c0dfc1bf495b2f04b93a5d7c0f55be702413fb"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.1/eidolon-macos-x86_64.tar.gz"
      sha256 "55554847c98209d6c982f77e9dc03423ec6c7a5f21df0693531c290b2847ec94"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.1/eidolon-linux-arm64.tar.gz"
      sha256 "a99f06bcd89c187d3368b904a917714da01615d88a955cf5fadbbd14718eec09"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.1/eidolon-linux-x86_64.tar.gz"
      sha256 "79486d88f7f412f8a2c2f2b0ae142d3173e45ec5264575b2050f6864c3109e65"
    end
  end

  def install
    # the executable as built (one file, its libraries packed inside); bin/eidolon says how it was installed, for
    # the review screen's update notice, and where it starts again after updating itself (opt/: every version's)
    libexec.install "eidolon"
    (bin/"eidolon").write_env_script libexec/"eidolon", EIDOLON_CHANNEL: "homebrew",
                                                        EIDOLON_RELAUNCH: opt_bin/"eidolon"
  end

  def caveats
    <<~TEXT
      Start it with: eidolon
      then open the address it prints (http://127.0.0.1:8765).
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eidolon --version")
  end
end

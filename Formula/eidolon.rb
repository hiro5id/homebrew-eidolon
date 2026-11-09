# Made by release.py from packaging/homebrew/eidolon.rb.in; the Release workflow commits it to hiro5id/homebrew-eidolon.
#   brew tap hiro5id/eidolon && brew install eidolon      brew update && brew upgrade eidolon
class Eidolon < Formula
  desc "Find duplicate photos and videos by how they look, and export one clean library"
  homepage "https://github.com/hiro5id/eidolon-releases"
  version "2026.11.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.4/eidolon-macos-arm64.tar.gz"
      sha256 "c951ea8ba5e4337e20f1a6bba19192cfbdeb20a38beee8f524acbd927a9b53be"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.4/eidolon-macos-x86_64.tar.gz"
      sha256 "2592d36ef8cb619cc8d3273424e4e53b88f05f1011a1213c6423d8f4b27ce412"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.4/eidolon-linux-arm64.tar.gz"
      sha256 "9163b8f0569e119288dcc2f365421aa3c7bf681adfd2fd7c8f51a91747892a9c"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.4/eidolon-linux-x86_64.tar.gz"
      sha256 "4012b037d7647402ff93d9423718cdf06cc83316275c1685f214ac2a1400017e"
    end
  end

  def install
    # the program's folder as built (Homebrew unpacks the archive's eidolon/ here: the executable, its _internal/
    # libraries); bin/eidolon says how it was installed, for the review screen's update notice, and where it starts
    # again after updating itself (opt/: every version's)
    libexec.install Dir["*"]
    (bin/"eidolon").write_env_script libexec/"eidolon", EIDOLON_CHANNEL: "homebrew",
                                                        EIDOLON_RELAUNCH: opt_bin/"eidolon"
  end

  def caveats
    <<~TEXT
      Start it with: eidolon
      Its window opens: Open shows the review screen (eidolon --no-window: in the terminal, at
      http://127.0.0.1:8765).
    TEXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eidolon --version")
  end
end

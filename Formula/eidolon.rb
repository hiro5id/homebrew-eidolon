# Made by release.py from packaging/homebrew/eidolon.rb.in; the Release workflow commits it to hiro5id/homebrew-eidolon.
#   brew install hiro5id/eidolon/eidolon      brew upgrade eidolon
class Eidolon < Formula
  desc "Find copies and Live Photo pairs in a photo and video library by how they look"
  homepage "https://github.com/hiro5id/eidolon-releases"
  version "2026.11.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.2/eidolon-macos-arm64.tar.gz"
      sha256 "aeedfb3cb5c335f5220efa811715d0726441570d3083b20f321be1863ada5dee"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.2/eidolon-macos-x86_64.tar.gz"
      sha256 "c42faa97aad9cf7742b88690f98fcc9aa9dbd48f934edbc065eb6df912d117a6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.2/eidolon-linux-arm64.tar.gz"
      sha256 "615fdfde2f709d1e1827fadbe436663f772f25de1cae9ea7c84c6c7ee736bfc4"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.2/eidolon-linux-x86_64.tar.gz"
      sha256 "39f5fe027fe07e77ab827937f039fea3cb4cb4d1084c5148fd4e54c5955958a5"
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

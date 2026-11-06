# Made by release.py from packaging/homebrew/eidolon.rb.in; the Release workflow commits it to hiro5id/homebrew-eidolon.
#   brew tap hiro5id/eidolon && brew install eidolon      brew upgrade eidolon
class Eidolon < Formula
  desc "Find copies and Live Photo pairs in a photo and video library by how they look"
  homepage "https://github.com/hiro5id/eidolon-releases"
  version "2026.11.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.3/eidolon-macos-arm64.tar.gz"
      sha256 "2972f2299d00e6a0399d58f62e530c4255b493d72c1ce4df1243cdd398e21c77"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.3/eidolon-macos-x86_64.tar.gz"
      sha256 "6768bb4349d49ea83a4f88e9b468c4e5e0b4e553651286f4ca6d0bdce159e5d8"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.3/eidolon-linux-arm64.tar.gz"
      sha256 "93b4643319cd104e6e3f82cb31f348f2370a591dfe34ba8dc08a4006c1118c86"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.3/eidolon-linux-x86_64.tar.gz"
      sha256 "bfc188fefcdbdd988b3bf8a90b1429019a329199529562089658f3fd208efbfc"
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

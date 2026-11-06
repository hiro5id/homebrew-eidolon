# Made by release.py from packaging/homebrew/eidolon.rb.in; the Release workflow commits it to hiro5id/homebrew-eidolon.
#   brew install hiro5id/eidolon/eidolon      brew upgrade eidolon
class Eidolon < Formula
  desc "Find copies and Live Photo pairs in a photo and video library by how they look"
  homepage "https://github.com/hiro5id/eidolon-releases"
  version "2026.11.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.0/eidolon-macos-arm64.tar.gz"
      sha256 "ea002804efdb7658e759a20f5845da8107db8e9263ebd7e8b30c01827c0c517c"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.0/eidolon-macos-x86_64.tar.gz"
      sha256 "4ff91212f1fd163e5b2cdbfa05b1b7e240bbd50342d0152e98e5dc95bee6acf1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.0/eidolon-linux-arm64.tar.gz"
      sha256 "524f8be3ccc786e84c7009ed2dcce033851f26948f2256a79827cd598e716b60"
    end
    on_intel do
      url "https://github.com/hiro5id/eidolon-releases/releases/download/v2026.11.0/eidolon-linux-x86_64.tar.gz"
      sha256 "d9c556feb171cb79b4007cbb297d5a22410e56b94792f0bc36a0007a619ce009"
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

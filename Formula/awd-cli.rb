class AwdCli < Formula
  desc "AI Workflow Director - Supercharge your development with AI-native workflows"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.6"  # This will be updated automatically
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64"
      sha256 "bca29b64a3becbd347109d6205b89ab150545b5b3058aee7ca40ccf4c6fe6393"  # This will be updated automatically
    else
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64"
      sha256 "5de4941512d4f0b0d2d6f8a3e78602d10d794278d029edc7cef6eb142dfff864"  # This will be updated automatically
    end
  end

  on_linux do
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64"
    sha256 "ac995a1eaac80e93d15098c39fbeac4407fc39aeda0429f852f763a70ef5293e"  # This will be updated automatically
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "awd-darwin-arm64" => "awd"
      else
        bin.install "awd-darwin-x86_64" => "awd"
      end
    else
      bin.install "awd-linux-x86_64" => "awd"
    end
  end

  test do
    system "#{bin}/awd", "--version"
  end
end
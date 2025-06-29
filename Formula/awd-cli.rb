class AwdCli < Formula
  desc "AI Workflow Director - Supercharge your development with AI-native workflows"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.1.0"  # This will be updated automatically
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64"
      sha256 "PLACEHOLDER_ARM64_SHA"  # This will be updated automatically
    else
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64"
      sha256 "PLACEHOLDER_X86_64_SHA"  # This will be updated automatically
    end
  end

  on_linux do
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64"
    sha256 "PLACEHOLDER_LINUX_SHA"  # This will be updated automatically
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
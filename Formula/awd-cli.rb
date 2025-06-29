class AwdCli < Formula
  desc "AI Workflow Director - Supercharge your development with AI-native workflows"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.7"  # This will be updated automatically
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64"
      sha256 "ca42e25f7056e502d5aaf9775334824e376cc7cf600ddbf32a4818a385fc3658"  # This will be updated automatically
    else
      url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64"
      sha256 "PLACEHOLDER_AMD64_SHA"  # This will be updated automatically
    end
  end

  on_linux do
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64"
    sha256 "PLACEHOLDER_LINUX_AMD64_SHA"  # This will be updated automatically
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
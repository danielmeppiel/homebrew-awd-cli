class AwdCli < Formula
  desc "Agentic Workflow Definitions (AWD): The NPM for AI-Native Development"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.8"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64.tar.gz"
    sha256 "PLACEHOLDER_DARWIN_ARM64_SHA_FOR_TAR_GZ"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64.tar.gz"
    sha256 "PLACEHOLDER_DARWIN_X86_64_SHA_FOR_TAR_GZ"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64.tar.gz"
    sha256 "PLACEHOLDER_LINUX_X86_64_SHA_FOR_TAR_GZ"
  end

  def install
    # Install the entire directory structure since the binary depends on _internal for dependencies
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"awd"
  end

  test do
    system "#{bin}/awd", "--version"
  end
end
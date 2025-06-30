class AwdCli < Formula
  desc "Agentic Workflow Definitions (AWD): The NPM for AI-Native Development"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.10"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64.tar.gz"
    sha256 "8e75cc25bb877e8a759fa914a3ff23b3d3f657b08f7ded4587c1b03c23c90e71"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64.tar.gz"
    sha256 "8f47dba043f37b9e5d5d8561cb23cc7dd08c46319e0f52e19e9e6d3e1d213859"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64.tar.gz"
    sha256 "fdfcf894886721b05bc3ef93118efde402cd942e0b42fc723b2f2318e4631d42"
  end

  def install
    # Install the entire directory structure since the binary depends on _internal for dependencies
    libexec.install Dir["*"]
    
    # Fix PyInstaller framework signing issue: Homebrew fails to sign Python.framework
    # because it's ambiguous between app and framework bundle format
    if OS.mac?
      # Remove the problematic existing signature that confuses Homebrew's codesign
      python_framework = "#{libexec}/_internal/Python.framework/Python"
      if File.exist?(python_framework)
        system "codesign", "--remove-signature", python_framework
      end
    end
    
    bin.write_exec_script libexec/"awd"
  end

  test do
    system "#{bin}/awd", "--version"
  end
end
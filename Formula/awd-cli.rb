class AwdCli < Formula
  desc "Agentic Workflow Definitions (AWD): The NPM for AI-Native Development"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.9"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64.tar.gz"
    sha256 "9ea4b50236f55c5597f324de53716ec4fad9f6a73e4b39f0d6e3a8da7b17d016"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64.tar.gz"
    sha256 "c025884c37231c17ea46cfacc53a99f7ff9b701bd5257cf0682db7e6bb6f01d0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64.tar.gz"
    sha256 "bbda1ba04afd171ab2104e90845227754b3fcc896929b31ca78aee8253bcae32"
  end

  def install
    # Install the entire directory structure since the binary depends on _internal for dependencies
    libexec.install Dir["*"]
    
    # Let Homebrew handle code signing automatically - no manual intervention needed
    # PyInstaller binaries work correctly with Homebrew's automatic signing process
    bin.write_exec_script libexec/"awd"
  end

  test do
    system "#{bin}/awd", "--version"
  end
end
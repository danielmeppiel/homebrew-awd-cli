class AwdCli < Formula
  desc "Agentic Workflow Definitions (AWD): The NPM for AI-Native Development"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.8"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64.tar.gz"
    sha256 "88fb1fc437e4edab136946757ae3837d156aeee902f12d7086f078d9f8d11fd3"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64.tar.gz"
    sha256 "5046ed478deb7df7516716ac2e87d11ee0fadd1ed1c2134e9e0154377ea26dc3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64.tar.gz"
    sha256 "52ac12b41b5fb0011d79d7e3720bb5ab9ed41a1dce120d58a41c4ec670b78971"
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
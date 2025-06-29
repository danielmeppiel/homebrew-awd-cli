class AwdCli < Formula
  desc "Agentic Workflow Definitions (AWD): The NPM for AI-Native Development"
  homepage "https://github.com/danielmeppiel/awd-cli"
  version "0.0.7"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-arm64"
    sha256 "ca42e25f7056e502d5aaf9775334824e376cc7cf600ddbf32a4818a385fc3658"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-darwin-x86_64"
    sha256 "024fbd1f6708363ed4407cd0892f16c19629f82ad13b284808aa0699b0ee77ec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/danielmeppiel/awd-cli/releases/download/v#{version}/awd-linux-x86_64"
    sha256 "fdb929171ac18340099a0a3312877174540d8e365980baa4af851d67975ee400"
  end

  def install
    bin.install Dir["*"].first => "awd"
  end

  test do
    system "#{bin}/awd", "--version"
  end
end
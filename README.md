# Homebrew Tap for AWD CLI

This is the official Homebrew tap for [AWD CLI](https://github.com/danielmeppiel/awd-cli).

## What is AWD CLI?

**The NPM for AI-Native Development** - Natural language in Markdown is the new scripting language. Now you can build, package, share, and run Markdown agentic prompts and workflows across any LLM runtime.

**Think npm + Node.js, but for Natural Language (Markdown).**

## Installation

```bash
brew tap danielmeppiel/awd-cli
brew install awd-cli
```

## Quick Start

```bash
# Setup AI runtime with GitHub Models
awd runtime setup codex
export GITHUB_TOKEN=your_token_here

# Initialize your first AWD project
awd init my-hello-world
cd my-hello-world

# Install and run
awd install
awd run start --param name="Developer"
```

## More Information

Visit the [main repository](https://github.com/danielmeppiel/awd-cli) for complete documentation, examples, and guides.

**AWD makes AI prompts as shareable and reusable as code packages.**
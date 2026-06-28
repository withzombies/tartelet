#!/bin/bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin"

if ! command -v swiftformat >/dev/null; then
  echo "error: SwiftFormat is not installed. Install it with: brew install swiftformat"
  exit 1
fi

if ! command -v swiftlint >/dev/null; then
  echo "error: SwiftLint is not installed. Install it with: brew install swiftlint"
  exit 1
fi

swiftformat --lint .

echo "Running SwiftLint..."
swiftlint --strict --quiet

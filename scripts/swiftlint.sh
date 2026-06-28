#!/bin/bash
set -euo pipefail

export PATH="$PATH:/opt/homebrew/bin"
if command -v swiftlint >/dev/null; then
  echo "Running SwiftLint..."
  swiftlint --strict
else
  echo "error: SwiftLint not installed, install with: brew install swiftlint"
  exit 1
fi

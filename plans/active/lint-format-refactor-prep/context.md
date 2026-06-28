# Context

Current baseline before implementation:
- SwiftLint 0.64.1 is installed and already configured.
- SwiftFormat 0.61.1 is installed but was not configured.
- SwiftLint strict reported four existing violations.
- Default SwiftFormat lint reported broad style drift, including generated files until excluded.
- Apple `swift-format` is installed but not selected to avoid formatter conflict.
- `scripts/lint.sh` now passes after SwiftFormat cleanup and targeted lint fixes.
- SwiftFormat is authoritative; Apple `swift-format` remains intentionally unused for this gate.
- Xcode app builds pass with `CODE_SIGNING_ALLOWED=NO`; normal local builds still require a valid `dk.shape.Tartelet` Mac App Development profile.
- The `Tartelet` test action currently fails before execution because the scheme/test plan has no test bundles available.
- `Packages/Settings` now declares the SettingsUI asset catalog resource, removing the SwiftPM unhandled-file warning.
- `SWIFT_STRICT_CONCURRENCY=targeted` currently emits warnings in `VirtualMachineEditor`, `VirtualMachineFleet`, and VM cancellation handling.
- `SWIFT_STRICT_CONCURRENCY=complete` additionally fails on non-Sendable global state in `Composers`; adopt it after actor/Sendable boundaries are redesigned.

Relevant files:
- `.swiftlint.yml`
- `.swiftformat`
- `scripts/format.sh`
- `scripts/lint.sh`
- `.github/workflows/swiftlint.yml`
- `xcconfigs/General.xcconfig`
- `Tartelet/Sources/AppDelegate.swift`
- `Packages/Settings/Package.swift`

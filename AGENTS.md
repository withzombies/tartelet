# Repository Guidelines

## Project Structure & Module Organization
Tartelet is a macOS Swift app generated with XcodeGen. The app target lives in `Tartelet/`; Swift sources are in `Tartelet/Sources`, assets in `Tartelet/Assets.xcassets`, entitlements in `Tartelet/Supporting files`, and the test plan in `Tartelet/Tartelet.xctestplan`.

Reusable code is split into local Swift packages under `Packages/`, including `GitHub`, `VirtualMachine`, `Settings`, `SSH`, and `Logging`. Targets usually follow `Sources/<Package><Layer>/`: `Domain` for models/protocols, `Data` for integrations, and `UI` for presentation. `project.yml` is the Xcode source of truth; `swiftgen.yml` controls generated resources.

## Build, Test, and Development Commands
- `xcodegen generate`: creates the `.xcodeproj`.
- `swiftgen`: regenerates typed constants for assets and localizations.
- `scripts/format.sh`: formats Swift sources with SwiftFormat.
- `scripts/lint.sh`: runs SwiftFormat lint and SwiftLint strict.
- `swift build --package-path Packages/<PackageName>`: builds one package.
- `swift test --package-path Packages/<PackageName>`: runs package tests when that package defines test targets.
- `xcodebuild -project Tartelet.xcodeproj -scheme Tartelet -testPlan Tartelet test`: builds and runs the app test plan after project generation.

Install missing tools with Homebrew: `brew install xcodegen swiftgen swiftlint swiftformat`.

## Coding Style & Naming Conventions
Use Swift 5.10 conventions, four-space indentation, explicit names, and the Swift API Design Guidelines. Keep type, generic type, and identifier names at or below the SwiftLint 60-character limit. Prefer existing boundaries over new abstractions.

Do not edit generated files such as `Internal/L10n.swift` or asset constants. Change the source `.strings` or `.xcassets` inputs, then run `swiftgen`.

## Testing Guidelines
Use RED-GREEN-REFACTOR for Swift behavior changes. If a package has no tests, add the needed SwiftPM `.testTarget` and matching `Tests/<TargetName>Tests` directory instead of assuming one exists. Run focused package checks while iterating, then the full Xcode test plan before PR when feasible. Do not disable failing tests.

## Agent-Specific Swift Workflow
For Swift code changes, use `$tartelet-swift-development`. Study three similar implementations first; when repo examples are insufficient, search at least three credible Swift/Xcode sources. Keep changes simple, reversible, formatted, lint-clean, and grounded in fresh verification.

## Commit & Pull Request Guidelines
Recent history uses short, imperative subjects. Prefer messages that explain the user-visible change or reason.

Pull requests should include a clear description, motivation, linked issue when applicable, and screenshots for UI changes. Confirm SwiftLint and relevant checks before review.

## Configuration & Security Notes
Local development may require replacing the default keychain access group in `Tartelet/Supporting files/Tartelet.entitlements` and `Tartelet/Sources/Composers.swift`. Do not commit personal team identifiers, credentials, private keys, or machine-specific Tart configuration.

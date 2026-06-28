# Tasks

## Now
- [x] Add SwiftFormat config and strict lint scripts.
- [x] Run formatter and fix remaining strict lint issues.
- [x] Verify lint, package builds, XcodeGen, and app compile.

## Next
- [ ] Restore or add test bundles for the `Tartelet` Xcode test plan.
- [ ] Refactor VM task ownership and composer singletons so `SWIFT_STRICT_CONCURRENCY=complete` can become a clean gate.
- [ ] Use the clean gate as the starting point for the refactor.

## Later
- [ ] Consider Apple `swift-format` as an additional lint-only gate after formatter conflicts are evaluated.

## Blocked
- `xcodebuild -project Tartelet.xcodeproj -scheme Tartelet -testPlan Tartelet test` reports no test bundles available.

## Done
- Added SwiftFormat config and strict lint scripts.
- Formatted the Swift codebase with generated files excluded.
- Fixed strict SwiftLint findings and the Swift concurrency warning surfaced by warnings-as-errors.
- `scripts/lint.sh`, `scripts/swiftlint.sh`, all package builds, `xcodegen generate`, and signing-disabled app compile pass.
- Probed strict concurrency; `targeted` still emits VM-domain warnings and `complete` fails on shared composer state, so it is deferred to the next refactor slice.

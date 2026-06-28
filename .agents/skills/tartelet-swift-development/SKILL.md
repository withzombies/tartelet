---
name: tartelet-swift-development
description: Use when modifying Swift code in Tartelet or its local Swift packages - applies repo architecture, Swift 5.10/macOS constraints, TDD, SwiftLint, XcodeGen, SwiftGen, and focused build/test verification.
---

<skill_overview>
Make Swift changes in Tartelet by proving behavior first, choosing the existing app/package boundary, and verifying with the narrowest reliable commands.
</skill_overview>

<rigidity_level>
MEDIUM FREEDOM - Adapt to the touched package, but do not skip discovery, RED tests for behavior changes, generated-file guardrails, or fresh verification.
</rigidity_level>

<quick_reference>
| Step | Action |
| --- | --- |
| Study | Inspect 3 similar repo implementations before coding; when repo examples are insufficient, search the internet for at least 3 credible Swift/Xcode sources. |
| Boundary | App wiring lives in `Tartelet/Sources`; reusable behavior belongs in `Packages/<Name>/Sources/<Name>{Domain,Data,UI}`. |
| RED | Add or update the narrowest XCTest first. If no test target exists, add a SwiftPM `.testTarget` and matching `Tests/<TargetName>Tests`. |
| GREEN | Implement the smallest Swift 5.10 change that passes the failing test. |
| Verify | Run focused `swift test`/`swift build`, then `scripts/lint.sh`; run `xcodegen generate` before Xcode test-plan verification when project files are involved. |
</quick_reference>

<workflow>
1. Search with `rg` before editing. Do not assume `Tests/` directories, `.testTarget`s, or generated files exist.
2. Keep dependency direction consistent: `Domain` defines models/protocols, `Data` implements integrations, `UI` owns presentation.
3. Never edit generated `Internal/L10n.swift` or asset constants. Edit `.strings` or `.xcassets`, then run `swiftgen`.
4. Keep names explicit and within the SwiftLint 60-character identifier/type limits. Follow Swift API Design Guidelines and existing local style.
5. Run `scripts/format.sh` before final lint. Verify only what the change can affect, then broaden. If a command cannot run because a test target/tool is absent, report that fact and the compensating check.
</workflow>

<critical_rules>
## Common Excuses
| Excuse | Required response |
| --- | --- |
| "Tests can wait" | Write the RED test first for behavior changes. |
| "There must be package tests" | Check `Package.swift` and the filesystem before naming or running tests. |
| "Generated files are easiest to patch" | Change SwiftGen inputs and regenerate. |
| "Xcode project edits are direct" | Update `project.yml`, then run `xcodegen generate`. |
</critical_rules>

<examples>
<example>
<scenario>Adding a settings toggle that affects a VM runner option.</scenario>
<correction>Inspect `Packages/Settings`, `Packages/VirtualMachine`, and `Tartelet/Sources/Composers.swift`; add the smallest test proving value-to-option mapping; implement storage/UI/wiring only where existing patterns require it; verify changed packages.</correction>
</example>

<example>
<scenario>Adding localized UI text.</scenario>
<correction>Edit the package `Localizable.strings`, run `swiftgen`, and never hand-edit `Internal/L10n.swift`.</correction>
</example>

<example>
<scenario>A package has no `Tests/` directory.</scenario>
<correction>Add a `.testTarget` in that package manifest and create `Tests/<TargetName>Tests`; do not claim `swift test --filter` coverage until the target exists and the RED test has failed for the expected reason.</correction>
</example>
</examples>

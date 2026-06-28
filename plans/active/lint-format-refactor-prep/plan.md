# Strict Lint and Format Refactor Prep

## Goal
Make formatting deterministic and make lint/compiler warnings fail before starting the larger refactor.

## Invariants
- Do not change runtime behavior.
- Do not hand-edit SwiftGen outputs.
- Keep generated files excluded from format/lint gates.
- Preserve existing AGENTS and repo-scoped skill work.

## Acceptance Checks
- `scripts/lint.sh` passes.
- Swift package builds pass for all local packages.
- `xcodegen generate` succeeds.
- The Xcode test plan is attempted and any environment/tooling failure is documented.

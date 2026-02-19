# Task Notes Manager - Dart Assessment

A pure Dart assessment project for Flutter developer candidates.

## Quick Start

```bash
dart pub get
dart test
```

## Structure

- `lib/` — Source code with `// TODO` stubs for candidates to complete
- `test/` — 57 unit tests that define expected behavior
- `EXAM_INSTRUCTIONS.md` — Full instructions given to candidates
- `score.sh` — Scoring script

## For Examiners

All TODO implementations are in 4 files:

| File | TODOs | Description |
|------|-------|-------------|
| `lib/models/note.dart` | 5 | fromJson, toJson, copyWith, equality |
| `lib/repositories/notes_repository.dart` | 6 | CRUD operations on in-memory list |
| `lib/services/notes_service.dart` | 10 | Business logic, validation, state |
| `lib/helpers/note_helpers.dart` | 3 | Pure utility functions |

**Do not modify:** `lib/models/note.g.dart` (generated), any test files.

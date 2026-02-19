# Task Notes Manager - Flutter Developer Assessment

## Story

You just joined **NoteFlow**, a fast-growing productivity startup. Your team is building a **Task Notes Manager** — a Dart application that helps users organize their thoughts by attaching notes to tasks.

The app was going smoothly until the lead developer left unexpectedly last week. They were in the middle of implementing core features, and now the codebase has **incomplete implementations** scattered throughout.

Your manager, Sarah, sends you this message:

> *"Hey! Welcome to the team. I know it's your first day, but we have a client demo tomorrow and some critical features aren't working. The good news is our QA team already wrote unit tests that define exactly how everything should work. Can you get all the tests passing by end of day? The test files are really helpful — they show exactly what each function should do. You've got this!"*

---

## The Application

**Task Notes Manager** is a pure Dart application following a layered architecture:

### Core Features
- **Add Notes** — Users can create new notes (3-500 characters) attached to a task
- **View Notes** — Notes are stored and retrievable from a repository
- **Delete Notes** — Users can remove notes they no longer need
- **Search Notes** — Notes can be filtered by text content (case-insensitive)

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                     Services Layer                           │
│  (NotesService — business logic, validation, state)         │
└─────────────────────┬───────────────────────────────────────┘
                      │ delegates to
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                   Repository Layer                           │
│  (NotesRepository — in-memory data storage & retrieval)     │
└─────────────────────┬───────────────────────────────────────┘
                      │ operates on
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                     Model Layer                              │
│  (Note — data model with JSON serialization)                │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                     Helpers                                   │
│  (Pure utility functions: filtering, sorting, counting)      │
└─────────────────────────────────────────────────────────────┘
```

### File Structure
```
lib/
├── models/
│   ├── note.dart          ← Note data model (COMPLETE — DO NOT EDIT)
│   └── note.g.dart        ← Generated JSON code (DO NOT EDIT)
├── repositories/
│   └── notes_repository.dart  ← Data storage (TODO)
├── services/
│   └── notes_service.dart     ← Business logic (TODO)
└── helpers/
    └── note_helpers.dart      ← Utility functions (TODO)

test/
├── repositories/notes_repository_test.dart
├── services/notes_service_test.dart
└── helpers/note_helpers_test.dart
```

---

## Your Mission

The QA team wrote unit tests that define how the app should behave. Your job is to find the incomplete implementations and fix them so **all tests pass**.

---

## Running Tests

```bash
dart pub get
dart test
```

To run a specific test file:
```bash
dart test test/models/note_test.dart
```

---

## Type Reference

```dart
class Note {
  final String noteId;    // Unique identifier
  final String text;      // Note content (3-500 chars)
  final String taskId;    // ID of the parent task
  final int createdAt;    // Unix timestamp in milliseconds
}
```

---

## Success Criteria

- All tests pass (`dart test` exits with 0 failures)
- No Dart analysis errors
- Do NOT modify any test files
- Do NOT modify `note.dart` or `note.g.dart` (provided / generated)

---

## Tips

1. **Read the test files** — they show exactly what each function should do
2. **Look for `TODO` comments** — the previous developer left hints
3. **Start with the repository** — the service depends on it
4. **Work bottom-up** — Repository → Helpers → Service
5. **The Note model is already complete** — read it to understand the data structure
6. **Watch out for edge cases** — empty strings, whitespace, case sensitivity

---

## Ready?

Run `dart test` and start fixing!

Good luck — Sarah is counting on you!

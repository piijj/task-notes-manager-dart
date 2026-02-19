import 'package:test/test.dart';
import 'package:task_notes_manager/models/note.dart';
import 'package:task_notes_manager/repositories/notes_repository.dart';
import 'package:task_notes_manager/services/notes_service.dart';

void main() {
  late NotesRepository repository;
  late NotesService service;

  setUp(() {
    repository = NotesRepository();
    service = NotesService(repository);
  });

  group('NotesService', () {
    group('initial state', () {
      test('should have empty notes list', () {
        expect(service.notes, isEmpty);
      });

      test('should not be loading', () {
        expect(service.isLoading, isFalse);
      });

      test('should have no error', () {
        expect(service.error, isNull);
      });

      test('should have empty search query', () {
        expect(service.searchQuery, isEmpty);
      });
    });

    group('loadNotes', () {
      test('should load notes from the repository', () {
        final note = Note(
          noteId: 'note-1',
          text: 'Test note',
          taskId: 'task-1',
          createdAt: 1700000000000,
        );
        repository.add(note);
        service.loadNotes();
        expect(service.notes.length, 1);
        expect(service.notes.first.noteId, 'note-1');
      });
    });

    group('createNote', () {
      test('should create a note and add it to the list', () {
        final note = service.createNote(text: 'Hello world', taskId: 'task-1');
        expect(note, isNotNull);
        expect(service.notes.length, 1);
        expect(service.notes.first.text, 'Hello world');
        expect(service.notes.first.taskId, 'task-1');
      });

      test('should prepend new notes to the beginning of the list', () {
        service.createNote(text: 'First note', taskId: 'task-1');
        service.createNote(text: 'Second note', taskId: 'task-1');
        expect(service.notes.first.text, 'Second note');
      });

      test('should also add the note to the repository', () {
        service.createNote(text: 'Repo note', taskId: 'task-1');
        expect(repository.count, 1);
      });

      test('should clear any previous error on success', () {
        service.createNote(text: 'ab', taskId: 'task-1');
        expect(service.error, isNotNull);
        service.createNote(text: 'Valid note', taskId: 'task-1');
        expect(service.error, isNull);
      });

      test('should reject text shorter than 3 characters', () {
        final note = service.createNote(text: 'ab', taskId: 'task-1');
        expect(note, isNull);
        expect(service.error, contains('at least 3'));
      });

      test('should reject text longer than 500 characters', () {
        final longText = 'a' * 501;
        final note = service.createNote(text: longText, taskId: 'task-1');
        expect(note, isNull);
        expect(service.error, contains('at most 500'));
      });

      test('should reject empty text', () {
        final note = service.createNote(text: '', taskId: 'task-1');
        expect(note, isNull);
        expect(service.error, isNotNull);
      });

      test('should reject whitespace-only text', () {
        final note = service.createNote(text: '   ', taskId: 'task-1');
        expect(note, isNull);
        expect(service.error, isNotNull);
      });

      test('should reject empty taskId', () {
        final note = service.createNote(text: 'Valid text', taskId: '');
        expect(note, isNull);
        expect(service.error, contains('Task ID'));
      });

      test('should trim text before validating length', () {
        final note = service.createNote(text: '  abc  ', taskId: 'task-1');
        expect(note, isNotNull);
        expect(note!.text, 'abc');
      });
    });

    group('deleteNote', () {
      test('should delete a note and remove it from the list', () {
        final note = service.createNote(text: 'To delete', taskId: 'task-1');
        final result = service.deleteNote(note!.noteId);
        expect(result, isTrue);
        expect(service.notes, isEmpty);
      });

      test('should also remove the note from the repository', () {
        final note = service.createNote(text: 'To delete', taskId: 'task-1');
        service.deleteNote(note!.noteId);
        expect(repository.count, 0);
      });

      test('should return false for a non-existent noteId', () {
        final result = service.deleteNote('does-not-exist');
        expect(result, isFalse);
        expect(service.error, isNotNull);
      });

      test('should reject empty noteId', () {
        final result = service.deleteNote('');
        expect(result, isFalse);
        expect(service.error, contains('Note ID'));
      });
    });

    group('searchNotes', () {
      test('should set the search query', () {
        service.searchNotes('hello');
        expect(service.searchQuery, 'hello');
      });

      test('should update existing search query', () {
        service.searchNotes('old');
        service.searchNotes('new');
        expect(service.searchQuery, 'new');
      });
    });

    group('filteredNotes', () {
      setUp(() {
        service.createNote(text: 'Hello world', taskId: 'task-1');
        service.createNote(text: 'Testing notes', taskId: 'task-1');
        service.createNote(text: 'Another note', taskId: 'task-2');
      });

      test('should return all notes when search query is empty', () {
        expect(service.filteredNotes.length, 3);
      });

      test('should filter notes case-insensitively', () {
        service.searchNotes('hello');
        final filtered = service.filteredNotes;
        expect(filtered.length, 1);
        expect(filtered.first.text, 'Hello world');
      });

      test('should return multiple matches', () {
        service.searchNotes('note');
        expect(service.filteredNotes.length, 2);
      });

      test('should treat whitespace-only query as empty', () {
        service.searchNotes('   ');
        expect(service.filteredNotes.length, 3);
      });
    });

    group('setLoading', () {
      test('should set loading to true', () {
        service.setLoading(true);
        expect(service.isLoading, isTrue);
      });

      test('should set loading to false', () {
        service.setLoading(true);
        service.setLoading(false);
        expect(service.isLoading, isFalse);
      });
    });

    group('resetAll', () {
      test('should clear notes, error, and search query', () {
        service.createNote(text: 'A note', taskId: 'task-1');
        service.searchNotes('note');
        service.createNote(text: 'ab', taskId: 'task-1');
        service.resetAll();
        expect(service.notes, isEmpty);
        expect(service.error, isNull);
        expect(service.searchQuery, isEmpty);
      });

      test('should also clear the repository', () {
        service.createNote(text: 'A note', taskId: 'task-1');
        service.resetAll();
        expect(repository.count, 0);
      });
    });
  });
}

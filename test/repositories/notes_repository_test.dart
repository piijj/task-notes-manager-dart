import 'package:test/test.dart';
import 'package:task_notes_manager/models/note.dart';
import 'package:task_notes_manager/repositories/notes_repository.dart';

void main() {
  late NotesRepository repository;

  final mockNote1 = Note(
    noteId: 'note-1',
    text: 'First note',
    taskId: 'task-1',
    createdAt: 1700000000000,
  );

  final mockNote2 = Note(
    noteId: 'note-2',
    text: 'Second note',
    taskId: 'task-1',
    createdAt: 1700000001000,
  );

  setUp(() {
    repository = NotesRepository();
  });

  group('NotesRepository', () {
    group('add and getAll', () {
      test('should return an empty list initially', () {
        expect(repository.getAll(), isEmpty);
      });

      test('should add a note and return it in getAll', () {
        repository.add(mockNote1);
        final all = repository.getAll();
        expect(all.length, 1);
        expect(all.first.noteId, 'note-1');
      });

      test('should add multiple notes', () {
        repository.add(mockNote1);
        repository.add(mockNote2);
        expect(repository.getAll().length, 2);
      });
    });

    group('getById', () {
      test('should return the correct note by id', () {
        repository.add(mockNote1);
        repository.add(mockNote2);
        final found = repository.getById('note-2');
        expect(found, isNotNull);
        expect(found!.text, 'Second note');
      });

      test('should return null for a non-existent id', () {
        repository.add(mockNote1);
        expect(repository.getById('does-not-exist'), isNull);
      });
    });

    group('delete', () {
      test('should remove a note and return true', () {
        repository.add(mockNote1);
        repository.add(mockNote2);
        final result = repository.delete('note-1');
        expect(result, isTrue);
        expect(repository.getAll().length, 1);
        expect(repository.getById('note-1'), isNull);
      });

      test('should return false when deleting a non-existent note', () {
        repository.add(mockNote1);
        final result = repository.delete('does-not-exist');
        expect(result, isFalse);
        expect(repository.getAll().length, 1);
      });
    });

    group('clear', () {
      test('should remove all notes', () {
        repository.add(mockNote1);
        repository.add(mockNote2);
        repository.clear();
        expect(repository.getAll(), isEmpty);
      });
    });

    group('count', () {
      test('should return 0 for an empty repository', () {
        expect(repository.count, 0);
      });

      test('should return the correct count after adding notes', () {
        repository.add(mockNote1);
        repository.add(mockNote2);
        expect(repository.count, 2);
      });
    });
  });
}

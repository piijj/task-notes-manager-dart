import 'package:test/test.dart';
import 'package:task_notes_manager/models/note.dart';
import 'package:task_notes_manager/helpers/note_helpers.dart';

void main() {
  final note1 = Note(
    noteId: 'note-1',
    text: 'Hello world',
    taskId: 'task-1',
    createdAt: 1700000001000,
  );

  final note2 = Note(
    noteId: 'note-2',
    text: 'Testing notes',
    taskId: 'task-1',
    createdAt: 1700000003000,
  );

  final note3 = Note(
    noteId: 'note-3',
    text: 'Another note',
    taskId: 'task-2',
    createdAt: 1700000002000,
  );

  final allNotes = [note1, note2, note3];

  group('filterNotes', () {
    test('should return all notes when query is empty', () {
      expect(filterNotes(allNotes, '').length, 3);
    });

    test('should return all notes when query is whitespace-only', () {
      expect(filterNotes(allNotes, '   ').length, 3);
    });

    test('should filter notes case-insensitively', () {
      final result = filterNotes(allNotes, 'hello');
      expect(result.length, 1);
      expect(result.first.text, 'Hello world');
    });

    test('should return multiple matches', () {
      final result = filterNotes(allNotes, 'note');
      expect(result.length, 2);
    });

    test('should return empty list when nothing matches', () {
      expect(filterNotes(allNotes, 'xyz'), isEmpty);
    });
  });

  group('sortByNewest', () {
    test('should sort notes by createdAt descending', () {
      final sorted = sortByNewest(allNotes);
      expect(sorted.first.noteId, 'note-2');
      expect(sorted.last.noteId, 'note-1');
    });

    test('should not modify the original list', () {
      final original = List<Note>.from(allNotes);
      sortByNewest(allNotes);
      expect(allNotes, equals(original));
    });
  });

  group('countByTaskId', () {
    test('should count notes per taskId', () {
      final counts = countByTaskId(allNotes);
      expect(counts['task-1'], 2);
      expect(counts['task-2'], 1);
    });

    test('should return an empty map for an empty list', () {
      expect(countByTaskId([]), isEmpty);
    });
  });
}

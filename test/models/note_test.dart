import 'package:test/test.dart';
import 'package:task_notes_manager/models/note.dart';

void main() {
  final mockNote = Note(
    noteId: 'note-1',
    text: 'Test note',
    taskId: 'task-1',
    createdAt: 1700000000000,
  );

  group('Note model', () {
    group('constructor', () {
      test('should create a note with all required fields', () {
        expect(mockNote.noteId, 'note-1');
        expect(mockNote.text, 'Test note');
        expect(mockNote.taskId, 'task-1');
        expect(mockNote.createdAt, 1700000000000);
      });
    });

    group('fromJson', () {
      test('should create a Note from a valid JSON map', () {
        final json = {
          'noteId': 'note-1',
          'text': 'Test note',
          'taskId': 'task-1',
          'createdAt': 1700000000000,
        };
        final note = Note.fromJson(json);
        expect(note.noteId, 'note-1');
        expect(note.text, 'Test note');
        expect(note.taskId, 'task-1');
        expect(note.createdAt, 1700000000000);
      });
    });

    group('toJson', () {
      test('should convert a Note to a JSON map', () {
        final json = mockNote.toJson();
        expect(json['noteId'], 'note-1');
        expect(json['text'], 'Test note');
        expect(json['taskId'], 'task-1');
        expect(json['createdAt'], 1700000000000);
      });

      test('should produce JSON that round-trips back to an equal Note', () {
        final json = mockNote.toJson();
        final restored = Note.fromJson(json);
        expect(restored, equals(mockNote));
      });
    });

    group('copyWith', () {
      test('should return a copy with updated text', () {
        final updated = mockNote.copyWith(text: 'Updated text');
        expect(updated.text, 'Updated text');
        expect(updated.noteId, mockNote.noteId);
        expect(updated.taskId, mockNote.taskId);
        expect(updated.createdAt, mockNote.createdAt);
      });

      test('should return a copy with updated taskId', () {
        final updated = mockNote.copyWith(taskId: 'task-99');
        expect(updated.taskId, 'task-99');
        expect(updated.text, mockNote.text);
      });

      test('should return an identical copy when no arguments are provided', () {
        final copy = mockNote.copyWith();
        expect(copy, equals(mockNote));
      });
    });

    group('equality', () {
      test('should be equal when all fields match', () {
        final note1 = Note(
          noteId: 'note-1',
          text: 'Test note',
          taskId: 'task-1',
          createdAt: 1700000000000,
        );
        expect(note1, equals(mockNote));
      });

      test('should not be equal when any field differs', () {
        final different = Note(
          noteId: 'note-2',
          text: 'Test note',
          taskId: 'task-1',
          createdAt: 1700000000000,
        );
        expect(different, isNot(equals(mockNote)));
      });
    });
  });
}

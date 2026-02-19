import '../models/note.dart';

class NotesRepository {
  final List<Note> _notes = [];

  // TODO: Return all notes in the repository
  List<Note> getAll() {
    throw UnimplementedError();
  }

  // TODO: Find and return a note by its noteId
  // Return null if no note with that id exists
  Note? getById(String noteId) {
    throw UnimplementedError();
  }

  // TODO: Add a note to the repository
  void add(Note note) {
    throw UnimplementedError();
  }

  // TODO: Remove a note by its noteId
  // Return true if the note was found and removed, false otherwise
  bool delete(String noteId) {
    throw UnimplementedError();
  }

  // TODO: Remove all notes from the repository
  void clear() {
    throw UnimplementedError();
  }

  // TODO: Return the total number of notes in the repository
  int get count {
    throw UnimplementedError();
  }
}

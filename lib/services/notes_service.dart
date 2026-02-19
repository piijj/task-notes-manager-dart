import '../models/note.dart';
import '../repositories/notes_repository.dart';

class NotesService {
  final NotesRepository _repository;

  List<Note> _notes = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  NotesService(this._repository);

  // --- Getters ---

  // TODO: Return the current list of notes
  List<Note> get notes {
    throw UnimplementedError();
  }

  // TODO: Return the current loading state
  bool get isLoading {
    throw UnimplementedError();
  }

  // TODO: Return the current error message (or null)
  String? get error {
    throw UnimplementedError();
  }

  // TODO: Return the current search query
  String get searchQuery {
    throw UnimplementedError();
  }

  // TODO: Return notes filtered by the current search query
  // - If searchQuery is empty or whitespace-only, return all notes
  // - Otherwise, return notes whose text contains the query (case-insensitive)
  List<Note> get filteredNotes {
    throw UnimplementedError();
  }

  // --- Actions ---

  // TODO: Load all notes from the repository into _notes
  void loadNotes() {
    throw UnimplementedError();
  }

  // TODO: Create a new note and add it to the repository
  // Validation rules:
  //   - text must be between 3 and 500 characters (after trimming)
  //   - text must not be empty or whitespace-only
  //   - taskId must not be empty
  // If validation fails, set _error with a descriptive message and return null
  // If validation passes:
  //   - Create a Note with a unique noteId (use DateTime.now().millisecondsSinceEpoch.toString())
  //   - Set createdAt to DateTime.now().millisecondsSinceEpoch
  //   - Add to repository, prepend to _notes, clear any error, and return the note
  Note? createNote({required String text, required String taskId}) {
    throw UnimplementedError();
  }

  // TODO: Delete a note by its noteId
  // Validation rules:
  //   - noteId must not be empty
  // If validation fails, set _error and return false
  // If the note is not found in the repository, set _error and return false
  // If successful, remove from _notes, clear error, and return true
  bool deleteNote(String noteId) {
    throw UnimplementedError();
  }

  // TODO: Set the search query to the given value
  void searchNotes(String query) {
    throw UnimplementedError();
  }

  // TODO: Reset all state: clear _notes, _error, _searchQuery, and the repository
  void resetAll() {
    throw UnimplementedError();
  }

  // TODO: Set the loading state
  void setLoading(bool value) {
    throw UnimplementedError();
  }
}

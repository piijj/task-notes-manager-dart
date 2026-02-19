import '../models/note.dart';

// TODO: Filter notes by a search query (case-insensitive)
// - If the query is empty or whitespace-only, return all notes
// - Otherwise, return only notes whose text contains the query (case-insensitive)
List<Note> filterNotes(List<Note> notes, String query) {
  throw UnimplementedError();
}

// TODO: Sort notes by createdAt in descending order (newest first)
// Return a NEW sorted list — do not modify the original
List<Note> sortByNewest(List<Note> notes) {
  throw UnimplementedError();
}

// TODO: Count the number of notes for each taskId
// Return a Map where keys are taskIds and values are the count of notes for that task
Map<String, int> countByTaskId(List<Note> notes) {
  throw UnimplementedError();
}

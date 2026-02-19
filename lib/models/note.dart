import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  final String noteId;
  final String text;
  final String taskId;
  final int createdAt;

  const Note({
    required this.noteId,
    required this.text,
    required this.taskId,
    required this.createdAt,
  });

  // TODO: Implement fromJson factory using the generated _$NoteFromJson
  factory Note.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  // TODO: Implement toJson method using the generated _$NoteToJson
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  // TODO: Implement copyWith method that returns a new Note with updated fields
  // Any parameter that is not provided should keep its current value
  Note copyWith({
    String? noteId,
    String? text,
    String? taskId,
    int? createdAt,
  }) {
    throw UnimplementedError();
  }

  // TODO: Implement equality operator
  // Two notes are equal if all their fields are equal
  @override
  bool operator ==(Object other) {
    throw UnimplementedError();
  }

  // TODO: Implement hashCode consistent with the equality operator
  @override
  int get hashCode {
    throw UnimplementedError();
  }
}

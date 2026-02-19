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

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note copyWith({
    String? noteId,
    String? text,
    String? taskId,
    int? createdAt,
  }) {
    return Note(
      noteId: noteId ?? this.noteId,
      text: text ?? this.text,
      taskId: taskId ?? this.taskId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Note &&
        other.noteId == noteId &&
        other.text == text &&
        other.taskId == taskId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => Object.hash(noteId, text, taskId, createdAt);
}

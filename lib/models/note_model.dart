import 'dart:convert';

class Note{
  final String id;
  final String  title;
  final String content;
  final DateTime createdAt;


  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt
});

  factory Note.fromJson(Map<String,dynamic> json){
    return Note(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        createdAt: DateTime.parse(json['createdAt'])
    );
  }

  Map<String,dynamic>toJson() => {
    'id':id,
    'title':title,
    'content':content,
    'createdAt':createdAt.toIso8601String(),
  };

  static List<Note> decode(String notes) =>
      (json.decode(notes) as List<dynamic>)
      .map((item) => Note.fromJson(item))
      .toList();

  static String encode(List<Note> notes) =>
      json.encode(notes.map((e) => e.toJson()).toList());

}
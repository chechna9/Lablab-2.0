// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chapter {
  String chapterTitle;
  String content;
  String image;
  Chapter({
    required this.chapterTitle,
    required this.content,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapterTitle': chapterTitle,
      'content': content,
      'image': image,
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      chapterTitle: map['chapterTitle'] as String,
      content: map['content'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source) as Map<String, dynamic>);
}

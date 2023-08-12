// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chapter {
  String chapterTitle;
  String content;
  String image;
  String? audio;
  Chapter({
    required this.chapterTitle,
    required this.content,
    required this.image,
    this.audio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': chapterTitle,
      'content': content,
      'image': image,
      'audio': audio,
    };
  }

  factory Chapter.fromMap2(Map<String, dynamic> map) {
    return Chapter(
      chapterTitle: map['title'] as String,
      content: map['content'] as String,
      image: map['image'] as String,
      audio: map['audio'] as String?,
    );
  }
  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      chapterTitle: map['text']['title'] as String,
      content: map['text']['content'] as String,
      image: map['image'] as String,
      audio: map['audio'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source) as Map<String, dynamic>);
}

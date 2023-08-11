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

  Chapter copyWith({
    String? chapterTitle,
    String? content,
    String? image,
  }) {
    return Chapter(
      chapterTitle: chapterTitle ?? this.chapterTitle,
      content: content ?? this.content,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapterTitle': chapterTitle,
      'content': content,
      'image': image,
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      chapterTitle: map['text']['chapterTitle'] as String,
      content: map['text']['content'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) =>
      Chapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Chapter other) {
    if (identical(this, other)) return true;

    return other.chapterTitle == chapterTitle &&
        other.content == content &&
        other.image == image;
  }

  @override
  int get hashCode => chapterTitle.hashCode ^ content.hashCode ^ image.hashCode;

  @override
  String toString() =>
      'Chapter(chapterTitle: $chapterTitle, content: $content, image: $image)';
}

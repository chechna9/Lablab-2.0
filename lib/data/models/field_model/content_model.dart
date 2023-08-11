// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lablab2/data/models/chapter%20_model/chapter.dart';

class ContentModel {
  final String title;
  final List<Chapter> chapters;

  ContentModel({
    required this.title,
    required this.chapters,
  });

  @override
  String toString() => 'ContentModel(title: $title, chapters: $chapters)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'chapters': chapters.map((x) => x.toMap()).toList(),
    };
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'] as String,
      chapters: List<Chapter>.from(
        (map['chapters'] as List<int>).map<Chapter>(
          (x) => Chapter.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentModel.fromJson(String source) =>
      ContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

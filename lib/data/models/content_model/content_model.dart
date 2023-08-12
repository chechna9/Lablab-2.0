// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:lablab2/data/models/chapter%20_model/chapter.dart';

class ContentModel {
  // final String? id;
  final String title;
  final List<Chapter> chapters;

  ContentModel({
    required this.title,
    required this.chapters,
    // this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'chapters': chapters.map((x) => x.toMap()).toList(),
    };
  }

  factory ContentModel.fromMap2(Map<String, dynamic> map) {
    return ContentModel(
      title: map['title'] as String,
      chapters: List<Chapter>.from(
        (map['chapters'] as List<dynamic>).map<Chapter>(
          (x) => Chapter.fromMap2(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> chaptersRaw = map["chapters"];

    List<Chapter> chapters = [];

    chaptersRaw.forEach((key, value) {
      chapters.add(Chapter.fromMap(value));
    });
    print(chapters);
    return ContentModel(
      title: map['title'] as String,
      // id: map['id'] as String?,
      chapters: chapters,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentModel.fromJson(String source) =>
      ContentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

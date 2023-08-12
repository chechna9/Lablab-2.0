import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/repositories/content/firestore_content.dart';

part 'newform_state.dart';

class NewformCubit extends Cubit<NewformState> {
  NewformCubit() : super(NewformInitial());

  String ktype = "Story";
  String language = "English";
  String length = "Short";
  String depth = "Superficial";
  String field = "Astronomy";
  String level = "Basic";
  String genres = "Drama";
  String chapter = "Short";
  String topic = "";

  List<String> morals = [];

  void setType(
    String type,
  ) {
    emit(NewformInitial());
    ktype = type;

    emit(NewformSuccess());
  }

  void setLanguage(String language) {
    emit(NewformInitial());
    this.language = language;
    emit(NewformSuccess());
  }

  void setlength(String length) {
    emit(NewformInitial());
    this.length = length;
    emit(NewformSuccess());
  }

  void setdepth(String depth) {
    emit(NewformInitial());
    this.depth = depth;
    emit(NewformSuccess());
  }

  void setgenres(String genres) {
    emit(NewformInitial());
    this.genres = genres;
    emit(NewformSuccess());
  }

  void setfield(String field) {
    emit(NewformInitial());
    this.field = field;
    emit(NewformSuccess());
  }

  void setlevel(String level) {
    emit(NewformInitial());
    this.level = level;
    emit(NewformSuccess());
  }

  void setChapter(String chapter) {
    emit(NewformInitial());
    this.chapter = chapter;
    emit(NewformSuccess());
  }

  void submit() async {
    try {
      emit(NewformLoading());
      Map<String, dynamic>? requestBody;

      http.Response? response;

      if (ktype == "Story") {
        print(morals);
        requestBody = {
          "generation_params": {
            "age": 10,
            "language": language,
            "story_genres": [genres],
            "story_morals": morals,
            "story_length": length,
            "story_chapter_length": chapter,
            "user_preferences": morals
          },
          "generate_images": false,
          "load_local": true,
          "save_local": false
        };

        response = await http.post(
          Uri.parse('https://kurio-generation-api.up.railway.app/story'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(requestBody),
        );
      } else {
        requestBody = {
          "generation_params": {
            "age": 10,
            "language": language,
            "field": field,
            "topic": topic,
            "learning_textbook_length": length,
            "learning_chapter_length": chapter,
            "depth": depth,
            "level": level,
            "user_preferences": morals,
          },
          "generate_images": true,
          "load_local": true,
          "save_local": false
        };

        response = await http.post(
          Uri.parse('https://kurio-generation-api.up.railway.app/textbook'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(requestBody),
        );
      }
      print("object");
      print(response.body);
      DepInj.locator
          .get<FirestoreCotentRepository>()
          .addContent(ContentModel.fromJson(response.body));
      if (response.statusCode == 200) emit(NewformLoaded());
    } catch (e) {
      print(e);
      emit(NewformError(e.toString()));
    }
  }

  void setTopic(String topic) {
    emit(NewformInitial());
    this.topic = topic;
    emit(NewformSuccess());
  }

  addMorals(String moral) {
    emit(NewformInitial());
    morals.add(moral);
    emit(NewformSuccess());
  }

  void removeMorals(String moral) {
    emit(NewformInitial());
    morals.remove(moral);
    emit(NewformSuccess());
  }
}

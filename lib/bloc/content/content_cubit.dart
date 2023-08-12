import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/repositories/content/content_reposirory.dart';
import 'package:lablab2/repositories/content/firestore_content.dart';

part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  ContentCubit() : super(ContentInitial());

  Future<void> getContent() async {
    emit(ContentLoading());
    try {
      final List<ContentModel> content =
          await DepInj.locator.get<FirestoreCotentRepository>().getContent();
      emit(ContentLoaded(content));
    } catch (e) {
      emit(ContentError(e.toString()));
    }
  }

  void selectContent(
      List<ContentModel> listContents, ContentModel content) async {
    emit(ContentSelected(content, listContents));
  }

  void unSelectContent(List<ContentModel> listContents) async {
    emit(ContentLoaded(listContents));
  }

  void deleteContent(ContentModel content) async {
    emit(ContentLoading());
    try {
      DepInj.locator.get<FirestoreCotentRepository>().deleteContent(content);
      getContent();
    } catch (e) {
      emit(ContentError(e.toString()));
    }
  }
}

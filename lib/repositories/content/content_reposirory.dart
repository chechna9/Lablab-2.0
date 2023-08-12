import 'package:lablab2/data/models/content_model/content_model.dart';

abstract class ContentRepository {
  // Future<List<ContentModel>> getContent();
  Future<void> getContent();
  Future<void> addContent(ContentModel content);
}

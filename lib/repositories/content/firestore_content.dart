import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lablab2/data/models/content_model/content_model.dart';
import 'package:lablab2/repositories/content/content_reposirory.dart';

class FirestoreCotentRepository extends ContentRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String contentCollection = 'content';
  @override
  Future<void> addContent(ContentModel content) async {
    await firestore.collection(contentCollection).add(content.toMap());
  }

  @override
  Future<List<ContentModel>> getContent() async {
    try {
      List<ContentModel> listContent = [];
      QuerySnapshot querySnapshot =
          await firestore.collection(contentCollection).get();
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;

        listContent.add(ContentModel.fromMap2(data));
      }
      return listContent;
    } catch (e) {
      throw Exception('Error getting content: $e');
    }
  }

  @override
  Future<void> deleteContent(ContentModel content) async {
    try {
      // await firestore.collection(contentCollection).doc(content.id!).delete();
      return;
    } catch (e) {
      throw Exception(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapexproject/model/category_model.dart';

class HomeServices {
  final _store = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategory() async {
    final data = await _store.collection('category').get();
    return data.docs.map((e) => CategoryModel.fromJson(e)).toList();
  }
}

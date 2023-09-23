import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sloth_shift/src/content/middle_content.dart';

class MainModel extends ChangeNotifier {
  // ListView.builderで使うためのBookのList booksを用意しておく。　
  List<MiddleContent> content = [];

  Future<void> fetchContent() async {
    // Firestoreからコレクション'books'(QuerySnapshot)を取得してdocsに代入。
    final docs = await FirebaseFirestore.instance.collection('users').doc('UID').collection('middle').get();

    // getter docs: docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    // map(): Listの各要素をBookに変換
    // toList(): Map()から返ってきたIterable→Listに変換する。
    final _titleValue = docs.docs
        .map((doc) => MiddleContent(doc)) 
        .toList();
    this.content = _titleValue; 
    notifyListeners(); 
  }
}
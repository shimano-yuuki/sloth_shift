import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sloth_shift/src/content/middle_content.dart';

class MainModel extends ChangeNotifier {
  List<MiddleContent> content = [];

  Future<void> fetchContent() async {
    final docs = await FirebaseFirestore.instance.collection('users').doc('UID').collection('middle').get();
    final _titleValue = docs.docs
        .map((doc) => MiddleContent(doc)) 
        .toList();
    this.content = _titleValue; 
    notifyListeners(); 
  }
}
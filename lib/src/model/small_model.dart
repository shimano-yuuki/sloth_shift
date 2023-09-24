import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sloth_shift/src/content/small_content.dart';

class MainModel extends ChangeNotifier {
  List<SmallContent> content = [];

  Future<void> fetchContent() async {
    final docs = await FirebaseFirestore.instance.collection('users').doc('UID').collection('弱火').get();
    final _titleValue = docs.docs
        .map((doc) => SmallContent(doc)) 
        .toList();
    this.content = _titleValue; 
    notifyListeners(); 
  }
}
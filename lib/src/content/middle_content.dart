import 'package:cloud_firestore/cloud_firestore.dart';

// firestoreのドキュメントを扱うクラスBookを作る。
class MiddleContent {
  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  MiddleContent(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    title = doc['title'];
    detail = doc['detail'];
    start_time = doc['startTime'];
    end_time = doc['endTime'];
    level = doc['level'];
  }
  // Bookで扱うフィールドを定義しておく。
  late String title;
  late String detail;
  late String start_time;
  late String end_time;
  late String level;
}

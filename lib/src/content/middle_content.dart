import 'package:cloud_firestore/cloud_firestore.dart';

// firestoreのドキュメントを扱うクラスBookを作る。
class MiddleContent {
  // ドキュメントを扱うDocumentSnapshotを引数にしたコンストラクタを作る
  MiddleContent(DocumentSnapshot doc) {
    //　ドキュメントの持っているフィールド'title'をこのBookのフィールドtitleに代入
    title = doc['title'];
    detail = doc['detail'];
    start_time = doc['start_time'];
    DateTime start_datetime = start_time.toDate();
    end_time = doc['end_time'];
    DateTime end_datetime = end_time.toDate();
    level = doc['level'];
  }
  // Bookで扱うフィールドを定義しておく。
  late String title;
  late String detail;
  late Timestamp start_time;
  late Timestamp end_time;
  late String level;
}

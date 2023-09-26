import 'package:flutter/material.dart';
import 'package:sloth_shift/src/app.dart';
import 'package:sloth_shift/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // main 関数でも async が使えます
  WidgetsFlutterBinding.ensureInitialized(); // runApp 前に何かを実行したいときはこれが必要です。
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

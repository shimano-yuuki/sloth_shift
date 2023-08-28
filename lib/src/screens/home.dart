import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/login_page.dart'; // ログインページのインポート

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          '予定一覧',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()), // ログインページに遷移
              );
            },
            icon: const Icon(Icons.login), // ログインアイコン
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginPage()), // ログインページに遷移
            );
          },
          child: const Text('ログイン'), // ボタンのテキスト
        ),
      ),
    );
  }
}

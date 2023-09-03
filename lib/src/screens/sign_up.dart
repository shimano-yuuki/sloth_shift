import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // ここにサインアップロジックを追加します
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    // この情報を使用してサインアップを行う処理を追加してください
                    // 例：Firebase Authenticationを使用したサインアップ
                  },
                  child: Text('新規登録'),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    // ここにサインアップロジックを追加します
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    // この情報を使用してサインアップを行う処理を追加してください
                    // 例：Firebase Authenticationを使用したサインアップ
                  },
                  child: Text('ログイン'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
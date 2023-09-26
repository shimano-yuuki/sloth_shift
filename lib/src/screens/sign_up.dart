import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('ログイン画面',
          style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'メール', fillColor: Colors.white,filled: true,),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'パスワード', fillColor: Colors.white,filled: true,),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black
                  ),
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                  },
                  child: Text('新規登録',style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black
                  ),
                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SlothShift()),
                    );
                  },
                  child: Text('ログイン',style: TextStyle(color: Colors.white),),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
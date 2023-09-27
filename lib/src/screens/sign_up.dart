import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 91, 91, 91),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: Image.asset('assets/images/icon.png'),
              ),
              SizedBox(height: 30),
              TextFormField(
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(labelText: 'メールアドレス',labelStyle: TextStyle(
            color: Colors.white,
          ),),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: const InputDecoration(labelText: 'パスワード',labelStyle: TextStyle(
                  color: Colors.white)),

                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 70),
              Row(
                children: [
                  SizedBox(width: 130),
                  ElevatedButton(
                    child: const Text('ユーザ登録',style: TextStyle(color: Colors.black)),
                    onPressed: () async {
                      try {
                        final User? user = (await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _email, password: _password))
                            .user;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SlothShift()),
                        );
                        if (user != null)
                          print("ユーザ登録しました ${user.email} , ${user.uid}");
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    child: const Text('ログイン',style: TextStyle(color: Colors.black),),
                    onPressed: () async {
                      try {
                        final User? user  = (await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _email, password: _password))
                            .user;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SlothShift()),
                        );
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
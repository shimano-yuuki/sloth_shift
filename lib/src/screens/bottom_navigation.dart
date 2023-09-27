import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/Strong/strong.dart';
import 'package:sloth_shift/src/screens/Middle/middle.dart';
import 'package:sloth_shift/src/screens/Small/small.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sloth_shift/src/screens/login.dart';

class SlothShift extends StatefulWidget {
  const SlothShift({Key? key}) : super(key: key);

  @override
  State<SlothShift> createState() => _SlothShiftState();
}

class _SlothShiftState extends State<SlothShift> {
  static const _screens = [
    SmallPage(),
    MiddlePage(),
    StrongPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // ユーザーがログインしていない場合、ログイン画面に遷移
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        LoginPage()), // LoginPage はログイン画面のクラス名に合わせて変更してください
              );
            },
            child: Text('ログイン'),
          ),
        ),
      );
    } else {
      // ユーザーがログイン済みの場合、選択された画面に遷移
      return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 28, 23, 23),
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/small.png'),
              ),
              label: '弱火',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/middle.png'),
              ),
              label: '中火',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/images/large.png'),
              ),
              label: '強火',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/home.dart';
import 'package:sloth_shift/src/screens/large.dart';
import 'package:sloth_shift/src/screens/Middle/middle.dart';
import 'package:sloth_shift/src/screens/Small/small.dart';

class SlothShift extends StatefulWidget {
  const SlothShift({Key? key}) : super(key: key);

  @override
  State<SlothShift> createState() => _SlothShiftState();
}

class _SlothShiftState extends State<SlothShift> {
  static const _screens = [
    HomePage(),
    SmallPage(),
    MiddlePage(),
    LargePage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset('assets/images/home.png'),
              ),
              label: 'ホーム',
            ),
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
        ));
  }
}

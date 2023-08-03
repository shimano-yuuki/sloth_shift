import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/home.dart';
import 'package:sloth_shift/src/screens/large.dart';
import 'package:sloth_shift/src/screens/middle.dart';
import 'package:sloth_shift/src/screens/small.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sloth_shift',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const SlothShift(),
    );
  }
}

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
          backgroundColor: Colors.black87,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.red,
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

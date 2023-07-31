import 'package:flutter/material.dart';

class LargePage extends StatelessWidget {
  const LargePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.redAccent,
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}

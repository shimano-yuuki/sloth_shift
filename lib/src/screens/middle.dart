import 'package:flutter/material.dart';

class MiddlePage extends StatelessWidget {
  const MiddlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定一覧：中火',
        style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
     ),
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

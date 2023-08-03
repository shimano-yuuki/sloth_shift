import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
          iconTheme: IconThemeData(
          color: Colors.red
          )
      ),
      body: Column(
        children: [
          Text('予定を追加する')
        ],
      ),
    );
  }
}
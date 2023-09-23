import 'package:flutter/material.dart';
class MiddleDetailPage extends StatelessWidget {
   MiddleDetailPage({
    super.key,
    required this.detail,
    required this.endTime,
    required this.level,
    required this.startTime,
    required this.title
  });

  final String detail;
  final String endTime;
  final String level;
  String startTime;
  final String title;



  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(startTime);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(title,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.black,
    ),
      body: Column(
    children: [
      Text(dateTime.day as String)
    ],
    )
    );
  }
}

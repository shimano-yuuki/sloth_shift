import 'package:flutter/material.dart';
class SmallDetailPage extends StatelessWidget {
   const SmallDetailPage({
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
  final String startTime;
  final String title;



  @override
  Widget build(BuildContext context) {
    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 91, 91, 91),
      appBar: AppBar(
        title: Text(title,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold),),
      backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
        actions:  [
          InkWell(child: Icon(Icons.delete),
            onTap: (){
            showAlertDialog(context);},
          ),
        ],
    ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 50),
        Text("${start.month}/${start.day}",
          style: const TextStyle(fontSize: 40,color: Colors.white)
          ),
        SizedBox(height: 10),
        Text("${start.hour}"+":"+"${start.minute}"+"〜"+"${end.hour}"+":"+"${end.minute}",
            style: const TextStyle(fontSize: 25,color: Colors.white)
        ),
      SizedBox(height:10),
      Text(detail,
          style: const TextStyle(fontSize: 20,color: Colors.white
          )
      )
    ],
    ),
      )
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('削除の確認'),
        children: [
          SimpleDialogOption(
            child: Text('削除'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: Text('キャンセル'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
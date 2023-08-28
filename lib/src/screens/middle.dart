import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/add.dart';

class MiddlePage extends StatelessWidget {
  const MiddlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> TemporaryList = ['朝ごはん', '昼ごはん', '夜ご飯'];
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('予定一覧：中火',
        style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: TemporaryList.length,
          itemBuilder: (BuildContext, index) {
            return Container(
              padding: const EdgeInsets.all(2),
              color: Colors.black,
              child: ListTile(
                title: Text('${TemporaryList[index]}',
                style: TextStyle(color: Colors.white),),
              )
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add_outlined,color: Colors.white,),
      ),
    );
  }
}

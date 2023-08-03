import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/add.dart';

class SmallPage extends StatelessWidget {
  const SmallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('予定一覧：弱火',
        style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
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

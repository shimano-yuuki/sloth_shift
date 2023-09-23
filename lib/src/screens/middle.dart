import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sloth_shift/src/screens/add.dart';
import 'package:sloth_shift/src/model/middle_model.dart';
import 'package:provider/provider.dart';
import 'package:sloth_shift/src/content/middle_content.dart';

List<DocumentSnapshot> documentList = [];

class MiddlePage extends StatelessWidget {
  const MiddlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..fetchContent(),
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: const Text('予定一覧：中火',
            style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold),),
            backgroundColor: Colors.black,
          ),
          body: Consumer<MainModel>(
            builder: (context, model, child) {
              final content = model.content;
              return ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        print(DateTime.now());
                      },
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(content[index].title),
                          ],
                        ),
                      ),
                    )
                  );
                }
              );
            },
          ),
          //追加ボタン addページに移動
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
        ),
      )   
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sloth_shift/src/model/small_model.dart';
import 'package:sloth_shift/src/screens/add.dart';

import 'small_detail.dart';

class SmallPage extends StatelessWidget {
  const SmallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SmallModel>(
      create: (_) => SmallModel()..fetchContent(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 91, 91, 91),
        appBar: AppBar(
          title: const Text(
            '予定一覧：弱火',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 28, 23, 23),
        ),
        body: Consumer<SmallModel>(
          builder: (context, model, child) {
            final content = model.content;
            return ListView.builder(
                itemCount: content.length,
                itemBuilder: (context, index) {
                  DateTime date = DateTime.parse(content[index].start_time);
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: SizedBox(
                            height: 60,
                            child: Card(
                              color: Color.fromARGB(255, 31, 31, 31),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SmallDetailPage(
                                              detail: content[index].detail,
                                              endTime: content[index].end_time,
                                              level: content[index].level,
                                              startTime:
                                                  content[index].start_time,
                                              title: content[index].title,
                                            )),
                                  );
                                },

                                child: Row(
                                  children:[
                                    SizedBox(width: 20),
                                    Text(
                                        "${date.month}/${date.day}",
                                        style: const TextStyle(fontSize: 20,color: Colors.white)
                                    ),
                                    SizedBox(width: 20),
                                  Text(
                                      content[index].title.length > 16
                                          ? content[index].title.substring(0, 16) +
                                          '...' // 17文字を超える場合、17文字まで切り取って "..." を追加
                                          : content[index].title,
                                      // 17文字以下の場合はそのまま表示
                                      style: TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          )),
                    ],
                  );
                });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add_outlined, color: Colors.white),
        ),
      ),
    );
  }
}

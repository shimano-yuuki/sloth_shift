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
      backgroundColor: Color.fromARGB(255, 91, 91, 91),
      appBar: AppBar(
        backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
          color: Colors.red
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(30),//全方向にのパディング
              child: Text('予定を追加する',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          const Row(
            children: [
            ],
          ),

          //レベルを選択
          const Padding(padding: 
            EdgeInsets.only(left: 30),
            child: Text('レベルを選択',
            style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: DropdownButtonMenu(),
          ),

          //予定のタイトル記入欄
          const Padding(
            padding: EdgeInsets.only(left: 30),//全方向にのパディング
              child: Text('予定のタイトル',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, bottom: 20, left: 30),
            child: TextFormField(
              // 上で作ったコントローラーを与えます。
              decoration: InputDecoration(
                hintText: 'タイトルを記入してください (必須)',
                hintStyle: const TextStyle(
                  fontSize: 10
                ),
                // 未選択時の枠線
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                // 選択時の枠線
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                // 中を塗りつぶす色
                fillColor: Colors.white,
                // 中を塗りつぶすかどうか
                filled: true,
              ),
            ),
          ),

          //予定の詳細記入欄
          const Padding(
            padding: EdgeInsets.only(left: 30),//全方向にのパディング
              child: Text('予定の詳細',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 30, left: 30),
            child: TextFormField(
              maxLines: 6,
              // 上で作ったコントローラーを与えます。
              decoration: InputDecoration(
                hintText: '詳細を記入してください (任意)',
                hintStyle: const TextStyle(
                  fontSize: 10
                ),
                // 未選択時の枠線
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                // 選択時の枠線
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                // 中を塗りつぶす色
                fillColor: Colors.white,
                // 中を塗りつぶすかどうか
                filled: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//ドロップダウンメニュー
class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}
class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String isSelectedValue = '弱火';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      
      items: const[
        DropdownMenuItem(
          value: '弱火',
          child: Text('弱火'),
        ),
        DropdownMenuItem(
            value: '中火',
            child: Text('中火'),
        ),
        DropdownMenuItem(
            value: '強火',
            child: Text('強火'),
        ),
      ],
      value: isSelectedValue,
      onChanged: (String? value) {
        setState(() {
          isSelectedValue = value!;
        });
      },
      iconEnabledColor: Colors.black,
    );
  }
}

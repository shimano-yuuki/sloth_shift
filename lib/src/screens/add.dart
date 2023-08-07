import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedValue = '弱火';
  String _titleValue = '';
  String _detailValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 91, 91, 91),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(30), //全方向にのパディング
              child: Text(
                '予定を追加する',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              children: [],
            ),
            //レベルを選択
            const Padding(
              padding: EdgeInsets.only(left: 30, bottom: 10),
              child: Text(
                'レベルを選択',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 30, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: DropdownButtonMenu(
                selectedValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
            ),
            //予定のタイトル記入欄
            const Padding(
              padding: EdgeInsets.only(left: 30), //全方向にのパディング
              child: Text(
                '予定のタイトル',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 30, bottom: 20, left: 30),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'タイトルを記入してください';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _titleValue = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'タイトルを記入してください (必須)',
                  hintStyle: const TextStyle(fontSize: 10),
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
              padding: EdgeInsets.only(left: 30), //全方向にのパディング
              child: Text(
                '予定の詳細',
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
                onChanged: (value) {
                  setState(() {
                    _detailValue = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: '詳細を記入してください (任意)',
                  hintStyle: const TextStyle(fontSize: 10),
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
            Row(
              children: [
                Container(width: 260,height: 230),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // background
                    foregroundColor: Colors.black, // foreground
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, do something with the values
                      // You can access _selectedValue, _titleValue, and _detailValue here
                      print('Selected value: $_selectedValue');
                      print('Title value: $_titleValue');
                      print('Detail value: $_detailValue');
                    }
                  },
                  child: Text('追加する'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//ドロップダウンメニュー
class DropdownButtonMenu extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const DropdownButtonMenu({required this.selectedValue, required this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: const [
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
      value: selectedValue,
      onChanged: onChanged,
      iconEnabledColor: Colors.black,
    );
  }
}
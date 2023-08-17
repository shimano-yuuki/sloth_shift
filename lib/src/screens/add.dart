import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

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
  DateTime _startDateTime = DateTime.now();
  DateTime _endDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 91, 91, 91),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.red,
        ),
        actions: [
          SizedBox(
            width: 110,
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // background
                foregroundColor: Colors.black, // foreground
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                await FirebaseFirestore.instance.collection('users').add({
                  'startTime': '$_startDateTime',
                  'endTime': '$_endDateTime',
                  'level': '$_selectedValue',
                  'title': '$_titleValue',
                  'detail': '$_detailValue',
                });
            
                Navigator.of(context).pop();
              }},
              child: const Text('追加する'),
            ),
          ),
        ],
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
        
              //開始日付を選択
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 15, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // background
                        foregroundColor: Colors.black, // foreground
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (dateTime) {
                            print('Date Time confirmed: $dateTime');
                            setState(() {
                              _startDateTime = dateTime;
                            });
                          },
                          currentTime: _startDateTime,
                          locale: LocaleType.jp,
                        );
                      },
                      child: Text('${_startDateTime.month}/${_startDateTime.day}  ${_startDateTime.hour}:${_startDateTime.minute}'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('〜',style: TextStyle(fontSize: 20,color: Colors.white)),
                  ),
                  //終了日付を設定
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // background
                        foregroundColor: Colors.black, // foreground
                      ),
                      onPressed: () {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          onConfirm: (dateTime) {
                            print('Date Time confirmed: $dateTime');
                            setState(() {
                              _endDateTime = dateTime;
                            });
                          },
                          currentTime: _endDateTime,
                          locale: LocaleType.jp,
                        );
                      },
                      child: Text('${_endDateTime.month}/${_endDateTime.day}  ${_endDateTime.hour}:${_endDateTime.minute}'),
                    ),
                  ),
                ],
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
                margin: const EdgeInsets.only(left: 30, bottom: 10),
                decoration: const BoxDecoration(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '詳細を記入してください';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _detailValue = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '詳細を記入してください (必須)',
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
            ],
          ),
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
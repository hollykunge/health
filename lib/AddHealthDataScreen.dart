import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddHealthDataScreen extends StatefulWidget {
  @override
  _AddHealthDataScreenState createState() => _AddHealthDataScreenState();
}

class _AddHealthDataScreenState extends State<AddHealthDataScreen> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('添加健康数据')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _typeController,
              decoration: InputDecoration(labelText: '数据类型'),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: '数据值'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 在这里实现添加数据的逻辑
              },
              child: Text('添加'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // 文字颜色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // 圆角
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInfoScreen extends StatefulWidget {
  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  // 其他控制器...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的信息')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(labelText: '昵称'),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: '用户名'),
            ),
            // 其他信息字段...
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 更新信息的逻辑
              },
              child: Text('更新信息'),
            ),
          ],
        ),
      ),
    );
  }
}

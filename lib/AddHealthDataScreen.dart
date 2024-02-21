import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'OcrHttp.dart'; // 确保这个文件中定义了uploadFile函数

class AddHealthDataScreen extends StatefulWidget {
  @override
  _AddHealthDataScreenState createState() => _AddHealthDataScreenState();
}

class _AddHealthDataScreenState extends State<AddHealthDataScreen> {
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  String _extractedText = ''; // 定义_extractedText变量来存储提取的文本

  void _pickImage() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (photo != null) {
      setState(() => _isUploading = true);
      _uploadPhoto(photo);
    }
  }

  void _uploadPhoto(XFile photo) async {
    try {
      final result = await uploadFile(photo);
      setState(() {
        _isUploading = false;
        _extractedText = result;
      });
    } catch (error) {
      setState(() {
        _isUploading = false;
        _extractedText = 'Error: $error'; // 保存错误信息
      });
    }
  }

  Widget _buildResultCard() {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SelectableText(_extractedText, // 使用SelectableText允许用户选择文本
          style: TextStyle(height: 1.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('添加健康数据')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isUploading) CircularProgressIndicator(),
            if (_extractedText.isNotEmpty) _buildResultCard(),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('打开相机'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

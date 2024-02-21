import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<String> uploadFile(XFile file) async {
  Uri uri = Uri.parse("http://192.168.31.48:8080/api/upload"); // 替换为您的API端点
  var request = http.MultipartRequest('POST', uri)
    ..files.add(await http.MultipartFile.fromPath('file', file.path));

  try {
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = utf8.decode(responseData);
      var jsonResponse = jsonDecode(responseString);

      if (jsonResponse['statusCode'] == 200) {
        print("上传成功: ${jsonResponse['data']}");
        // 假设服务器返回的识别文本在'data'字段中
        return jsonResponse['data'];
      } else {
        return "上传失败: ${jsonResponse['message']}";
      }
    } else {
      return "请求失败: 状态码 ${response.statusCode}";
    }
  } catch (e) {
    return "异常错误: $e";
  }
}

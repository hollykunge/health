class HealthData {
  String type; // 如 '血压', '心率', '体检报告' 等
  String value; // 存储数据或报告的具体内容
  DateTime date; // 数据的日期

  HealthData({required this.type, required this.value, required this.date});
}

import 'package:flutter/material.dart';

import 'HealthData.dart';

class HealthDataCard extends StatelessWidget {
  final HealthData healthData;

  HealthDataCard({required this.healthData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 确保内容靠左对齐
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  healthData.type,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  formatRelativeTime(healthData.date),
                  style: TextStyle(color: Colors.grey), // 时间显示为灰色
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              healthData.value,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.blue, // 突出显示关键指标
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatRelativeTime(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return '${difference.inDays}天前';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }

}

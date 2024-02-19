import 'package:flutter/material.dart';
import 'HealthData.dart';
import 'HealthDataCard.dart';

class MyDataScreen extends StatefulWidget {
  @override
  _MyDataScreenState createState() => _MyDataScreenState();
}

class _MyDataScreenState extends State<MyDataScreen> {
  final List<HealthData> dailyMonitoringData = [
    // 示例数据: 血压、心率等
    // ...
  ];

  final List<HealthData> reportData = [
    // 示例数据: 检查报告单摘要
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('我的数据', style: TextStyle(color: Colors.white)), // 白色字体
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(text: '日常监测'),
              Tab(text: '检查报告'),
            ],
            labelColor: Colors.white, // Tab标签文字颜色设为白色
          ),
        ),
        body: TabBarView(
          children: [
            _buildDailyMonitoringTab(dailyMonitoringData),
            _buildReportTab(reportData),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyMonitoringTab(List<HealthData> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return HealthDataCard(healthData: data[index]);
      },
    );
  }

  Widget _buildReportTab(List<HealthData> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return HealthDataCard(healthData: data[index]);
      },
    );
  }
}

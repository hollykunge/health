import 'package:flutter/material.dart';

import 'AddHealthDataScreen.dart';
import 'MyDataScreen.dart';
import 'MyInfoScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MyDataScreen(),
    MyInfoScreen(),
  ];

  void _navigateToAddHealthData(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddHealthDataScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddHealthData(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '我的数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的信息',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

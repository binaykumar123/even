import 'package:even/features/home_screen/ui/widgets/bottom_navigation_bar.dart';
import 'package:even/features/my_history/ui/screen/my_history_screen.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  void _changeTab(int index) {
    _tabController?.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(
        changeTabToIndex: _changeTab,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Scaffold(
            body: Center(
              child: Text('Home Screen'),
            ),
          ),
          MyHistoryScreen(
            changeTab: _changeTab,
          ),
          Scaffold(
            body: Center(
              child: Text('Home Screen'),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text('Home Screen'),
            ),
          ),
        ],
      ),
    );
  }
}

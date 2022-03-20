import 'package:flutter/material.dart';
import 'package:clyde_project/ui/component.dart';
import 'package:clyde_project/ui/screen/home.dart';
import 'package:clyde_project/ui/screen/explore.dart';
import 'package:clyde_project/ui/component/logic.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    _MyAppState(){
      dynamic ish=fetchAlbum();
      print(ish);
    }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clyde Wallet',
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum TabItem { home, explore, notification, setting }

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.explore,
    TabItem.notification,
    TabItem.setting
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
            left: const Icon(Icons.notes, color: Colors.black54),
            title: 'Clyde Wallet',
            right:
                const Icon(Icons.account_balance_wallet, color: Colors.black54),
          ),
        ),
      ),
      body: _buildScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomTabs
          .map((tabItem) => _bottomNavigationBarItem(_icon(tabItem), tabItem))
          .toList(),
      onTap: _onSelectTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, TabItem tabItem) {
    final Color color =
        _currentItem == tabItem ? Colors.black54 : Colors.black26;

    return BottomNavigationBarItem(icon: Icon(icon, color: color), label: '');
  }

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.explore:
        return Icons.explore;
      case TabItem.notification:
        return Icons.notifications;
      case TabItem.setting:
        return Icons.settings;
      default:
        throw 'Unknown $item';
    }
  }

  Widget _buildScreen() {
    switch (_currentItem) {
      case TabItem.home:
        return const HomeScreen();
      case TabItem.explore:
        return const ExploreScreen();
      case TabItem.notification:
      // return HomeScreen()
      case TabItem.setting:
      // return HomeScreen()
      default:
        return const HomeScreen();
    }
  }
}

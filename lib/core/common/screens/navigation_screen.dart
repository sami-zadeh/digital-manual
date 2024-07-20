import 'package:flutter/cupertino.dart'
    hide CupertinoTabScaffold, CupertinoTabBar;

import '../widgets/cupertino_tab_scaffold.dart';
import '../widgets/custom_cupertino_tab_bar.dart';
import 'home/presentation/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  static const screens = [HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cube_box),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera_viewfinder),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.envelope),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Account',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        index = 0;
        return CupertinoTabView(
          builder: (context) => screens[index],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:patananny/utils/theme/theme.dart';

import 'nannypages.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavScreen> {
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  void _onTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: NannyTheme.mainColor,
        unselectedItemColor: Colors.grey.shade700,
        unselectedFontSize: 8,
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.rice_bowl,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
      ),
      body: nannyPages[pageIndex],
    );
  }
}
